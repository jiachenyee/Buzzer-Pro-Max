//
//  TriviaQuestion.swift
//  Buzzer Pro Max (Shared)
//
//  Created by Jia Chen Yee on 8/3/22.
//

import Foundation

struct TriviaQuestion {
    var title: String
    var duration: TimeInterval = 30
    var answer: String = ""
    
    static var all: [TriviaQuestion] = [
        TriviaQuestion(title: "What is the latest version of Swift?", answer: """
Swift 5.6
"""),
        TriviaQuestion(title: "List all variants of the M1 Processor", answer: """
M1
M1 Pro
M1 Pro Max
M1 Ultra
"""),
        TriviaQuestion(title: "Name one iPhone from every year in chronological order", answer: """
2007 - iPhone
2008 - iPhone 3G
2009 - iPhone 3GS
2010 - iPhone 4
2011 - iPhone 4S
2012 - iPhone 5
2013 - iPhone 5S or iPhone 5C
2014 - iPhone 6 or iPhone 6 Plus
2015 - iPhone 6S or iPhone 6S Plus or iPhone SE
2016 - iPhone 7 or iPhone 7 Plus
2017 - iPhone 8 or iPhone 8 Plus or iPhone X
2018 - iPhone XR or iPhone XR or iPhone XS Max
2019 - iPhone 11 or iPhone 11 Pro or iPhone 11 Pro Max
2020 - iPhone SE Gen 2 or iPhone 12 or iPhone 12 Pro or iPhone 12 Mini or iPhone 12 Pro Max
2021 - iPhone 13 or iPhone 13 Mini or iPhone 13 Pro or iPhone 13 Pro Max
2022 - iPhone SE Gen 3
"""),
        TriviaQuestion(title: "Name 6 Applications Apple created for the Mac", answer: """
Accept anything on the Mac LOL
Final Cut Pro X
Logic Pro
Xcode
Any System Utilities
iWork Suite (Keynote, Numbers, Pages)
"""),
        TriviaQuestion(title: "List 3 reasons why Git is especially important when doing app development", answer: """
Accept any acceptable answers, suggested answers include:
(Answers from 2019)
1. Collaboration between teams

2. Useful functions like branching out and rolling back commits ensure you don’t screw yourself over when making a mistake

3. Services like GitHub and BitBucket exist so that your projects can be stored in the cloud and in a case that your mac is broken and all else fails, you still can work on your projects

4. Open sourcing projects will help by having other people help you fix bugs and test your stuff

"""),
        TriviaQuestion(title: "What year and when was the inaugural Swift Innovators' Summit Held?", answer: """
10 November 2018
School of Science and Technology, Singapore
"""),
        TriviaQuestion(title: "Which search engine came default with Siri back in 2016?", answer: """
Bing
"""),
        TriviaQuestion(title: "Which app did Group 0 make?", answer: """
Let's Not
"""),
        TriviaQuestion(title: "Describe any of the key pillars of Computational Thinking, giving its name and definition", answer: """
Decomposition: Breaking down a complex problem or system into smaller, more manageable parts

Algorithm: Developing a step-by-step solution to the problem, or the rules to follow to solve the problem

Pattern Recognition: Looking for similarities among and within problems

Abstraction: Focusing on the important information only, ignoring irrelevant detail
"""),
        TriviaQuestion(title: "List 5 External Speakers that have spoken to your batch", answer: """
Ans: Accept anything that makes sense 
Apple: Addy, Vic Sent, Christian 
Gayle, Jeffery
""")
    ]
}
