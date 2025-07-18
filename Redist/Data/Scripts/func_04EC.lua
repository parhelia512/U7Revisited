-- Ellen's NPC number is 236 decimal, EC hex.
function func_04EC(eventid, objectref)
    local var_0000, var_0001
    start_conversation()
    if eventid == 1 then
        switch_talk_to(236, 0)
        var_0000 = get_schedule_time()
        if var_0000 == 7 then
            var_0001 = (get_schedule(236) == 16)
            if var_0001 then
                add_dialogue("Ellen puts her finger to her lips. There is a Fellowship meeting going on.")
            else
                add_dialogue("\"Hello. I am sorry to be rude, but I am late to the Fellowship meeting. May we speak another time?\"")
            end
            return
        end
        if not get_flag(80) then
            add_dialogue("This is a woman who seems pleasant and welcoming. \"I am proud to meet the Avatar,\" she says, beaming.")
            set_flag(80, true)
            else
                add_dialogue("\"Yes, Avatar?\" Ellen asks.")
        end

        add_answer({"bye", "murder", "job", "name"})

        while true do
            coroutine.yield(0)
            local answer = get_answer()
            debug_print("Answer is " .. answer .. ".")
            if answer == "name" then
                add_dialogue("\"My name is Ellen.\"")
                remove_answer("name")
            elseif answer == "job" then
                add_dialogue("\"I do the bookkeeping at the Fellowship Branch. I work with mine husband, Klog.\"")
                add_answer({"Klog", "Fellowship"})
            elseif answer == "murder" then
                add_dialogue("\"'Tis awful, is it not? Of course, I was home with Klog all night.\"")
                remove_answer("murder")
            elseif answer == "Fellowship" then
                add_dialogue("\"Perhaps thou couldst call it a 'confident philosophy'. We meet here at the branch office every night.\"")
                add_answer({"branch office", "philosophy"})
                remove_answer("Fellowship")
            elseif answer == "branch office" then
                add_dialogue("\"The Fellowship has branches all over Britannia. It is a most popular philosophical society.\"")
                remove_answer("branch office")
            elseif answer == "Klog" then
                add_dialogue("\"Mine husband Klog is a wonderful branch leader. He is an inspiration to all of the Trinsic members.\"")
                remove_answer("Klog")
            elseif answer == "philosophy" then
                remove_answer("philosophy")
                func_091A()
            elseif answer == "bye" then
                add_dialogue("\"Goodbye. I hope to see thee again, soon.\"")
                clear_answers()
            end
        end
    elseif eventid == 0 then
        unknown_092EH(236)
    end
    return
end