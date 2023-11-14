import http from "k6/http";
import { sleep } from "k6";

export const options = {
  scenarios: {
    contacts: {
      executor: 'ramping-vus',
      startVUs: 0,
      stages: [
        { duration: '60s', target: 5 },
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
      name: "Smoke Test",
    },
  },
};

export default function () {
  const params = {
    headers: {
      Authorization: `Bearer ${__ENV.AUTH_TOKEN}`,
      'X-IDTOKEN': `${__ENV.ID_TOKEN}`, 
    },
  };

  const payload = JSON.stringify({
    action: 'add',
    amount: 1
  });

  http.get(
    "https://vm1swtn9ii.execute-api.ap-southeast-1.amazonaws.com/v1/points/accounts/paginate",
    params
  );
  http.get(
    "https://vm1swtn9ii.execute-api.ap-southeast-1.amazonaws.com/v1/users/accounts/paginate",
    params
  );
  http.get(
    "https://vm1swtn9ii.execute-api.ap-southeast-1.amazonaws.com/v1/points/accounts/6062f766-5313-4521-9c56-954185b85362",
    params
  );
  http.get(
    "https://vm1swtn9ii.execute-api.ap-southeast-1.amazonaws.com/v1/users/accounts/0501e0ee-81cd-4004-ad8d-357a5b4359a4",
    params
  );
  sleep(1);
}