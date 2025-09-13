import React from 'react';
import { motion } from 'framer-motion';
import { Quote, Lightbulb, Smile, Brain, Heart } from 'lucide-react';
import { ContentItem } from '../lib/supabase';

interface ContentCardProps {
  content: ContentItem | null;
  isVisible: boolean;
}

const ContentCard: React.FC<ContentCardProps> = ({ content, isVisible }) => {
  if (!content || !isVisible) return null;

  const cardVariants = {
    hidden: { opacity: 0, y: 50 },
    visible: { 
      opacity: 1, 
      y: 0,
      transition: {
        duration: 0.6,
        staggerChildren: 0.1
      }
    }
  };

  const itemVariants = {
    hidden: { opacity: 0, x: -20 },
    visible: { opacity: 1, x: 0 }
  };

  const contentSections = [
    {
      icon: <Heart className="w-5 h-5" />,
      title: "Today's Activity",
      content: content.activity,
      bgColor: "bg-gradient-to-r from-pink-500 to-rose-500",
      textColor: "text-pink-700"
    },
    {
      icon: <Quote className="w-5 h-5" />,
      title: "Inspiring Quote",
      content: `"${content.quote}" — ${content.author}`,
      bgColor: "bg-gradient-to-r from-blue-500 to-indigo-500",
      textColor: "text-blue-700"
    },
    {
      icon: <Smile className="w-5 h-5" />,
      title: "Daily Laugh",
      content: content.joke,
      bgColor: "bg-gradient-to-r from-yellow-500 to-orange-500",
      textColor: "text-yellow-700"
    },
    {
      icon: <Brain className="w-5 h-5" />,
      title: "Number Fact",
      content: content.number_fact,
      bgColor: "bg-gradient-to-r from-purple-500 to-violet-500",
      textColor: "text-purple-700"
    },
    {
      icon: <Lightbulb className="w-5 h-5" />,
      title: "Life Advice",
      content: content.advice,
      bgColor: "bg-gradient-to-r from-green-500 to-emerald-500",
      textColor: "text-green-700"
    }
  ];

  return (
    <motion.div
      variants={cardVariants}
      initial="hidden"
      animate="visible"
      className="w-full max-w-4xl mx-auto space-y-6"
    >
      {contentSections.map((section, index) => (
        <motion.div
          key={index}
          variants={itemVariants}
          className="bg-white rounded-2xl shadow-xl p-6 hover:shadow-2xl transition-shadow duration-300"
        >
          <div className="flex items-start space-x-4">
            <div className={`${section.bgColor} p-3 rounded-full text-white shadow-lg`}>
              {section.icon}
            </div>
            <div className="flex-1">
              <h3 className={`font-semibold text-lg ${section.textColor} mb-2`}>
                {section.title}
              </h3>
              <p className="text-gray-700 leading-relaxed text-lg">
                {section.content}
              </p>
            </div>
          </div>
        </motion.div>
      ))}
    </motion.div>
  );
};

export default ContentCard;