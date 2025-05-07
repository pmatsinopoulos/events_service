class Event < ApplicationRecord
  enum :event_type, {
    tennis_tournament: "tennis_tournament",
    golf_tournament: "golf_tournament",
    football_tournament: "football_tournament",
    basketball_tournament: "basketball_tournament",
    baseball_tournament: "baseball_tournament",
    hockey_tournament: "hockey_tournament",
    volleyball_tournament: "volleyball_tournament",
    swimming_tournament: "swimming_tournament",
    athletics_tournament: "athletics_tournament",
    cycling_tournament: "cycling_tournament",
    ethereum_conference: "ethereum_conference",
    bitcoin_conference: "bitcoin_conference",
    blockchain_conference: "blockchain_conference",
    ai_conference: "ai_conference",
    ml_conference: "ml_conference",
    data_science_conference: "data_science_conference",
    cloud_computing_conference: "cloud_computing_conference",
    cybersecurity_conference: "cybersecurity_conference"
  }
end
