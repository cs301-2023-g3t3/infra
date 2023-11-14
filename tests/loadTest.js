import http from "k6/http";
import { sleep } from "k6";

export const options = {
  scenarios: {
    contacts: {
      executor: 'ramping-vus',
      startVUs: 0,
      stages: [
        { duration: '30s', target: 20 },
        { duration: '30s', target: 60 },
        { duration: '80s', target: 100 },
        { duration: '300s', target: 100 },
        { duration: '300s', target: 100 },
        { duration: '60s', target: 0 },
      ],
      gracefulRampDown: '0s',
    },
  },
  // vus: 100,
  // duration: "10s",
  ext: {
    loadimpact: {
      // Project: Default project
      projectID: 3667423,
      // Test runs with the same name groups test runs together.
      name: "Load Test",
    },
  },
};

export default function () {
  const params = {
    headers: {
      Authorization: `Bearer ${__ENV.AUTH_TOKEN}`,
    },
  };

  const payload = JSON.stringify({
    action: 'add',
    amount: 1
  });

  http.get(
    "https://vm1swtn9ii.execute-api.ap-southeast-1.amazonaws.com/v1/points/accounts/paginate",
    // payload,
    params
  );
  sleep(1);
}