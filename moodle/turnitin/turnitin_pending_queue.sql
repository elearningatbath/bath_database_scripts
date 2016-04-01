SELECT COUNT(EQH.id)
FROM mdl5_events_queue_handlers EQH
      JOIN mdl5_events_handlers EH ON EQH.handlerid = EH.id
WHERE component = "plagiarism_turnitin";