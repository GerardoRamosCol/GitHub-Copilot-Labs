const release = {
  product: "Northstar Collaboration",
  version: "2.4.0",
  targetDate: "2026-09-19",
};

const changes = [
  "Faster workspace search",
  "Updated notification controls",
  "Retry failed exports",
];

const risks = [
  "Search index rebuild may increase latency",
];

document.querySelector("#release-details").textContent =
  `${release.product} ${release.version} targets ${release.targetDate}.`;

function renderList(selector, items) {
  const list = document.querySelector(selector);
  list.replaceChildren(...items.map((item) => {
    const listItem = document.createElement("li");
    listItem.textContent = item;
    return listItem;
  }));
}

renderList("#change-list", changes);
renderList("#risk-list", risks);