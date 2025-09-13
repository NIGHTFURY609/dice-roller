import React from 'react';
import { motion } from 'framer-motion';

interface DiceRollProps {
  isRolling: boolean;
  onRoll: () => void;
  disabled: boolean;
}

const DiceRoll: React.FC<DiceRollProps> = ({ isRolling, onRoll, disabled }) => {
  return (
    <div className="flex flex-col items-center space-y-6">
      <motion.div
        className="relative w-24 h-24 cursor-pointer"
        whileHover={{ scale: 1.05 }}
        whileTap={{ scale: 0.95 }}
        onClick={onRoll}
      >
        <motion.div
          className="w-full h-full bg-gradient-to-br from-blue-500 to-purple-600 rounded-xl shadow-lg flex items-center justify-center text-white text-4xl font-bold"
          animate={
            isRolling
              ? {
                  rotateX: [0, 180, 360, 540, 720],
                  rotateY: [0, 180, 360, 540, 720],
                  scale: [1, 1.1, 1, 1.1, 1],
                }
              : { rotateX: 0, rotateY: 0, scale: 1 }
          }
          transition={{
            duration: isRolling ? 2 : 0.3,
            ease: "easeInOut",
          }}
          style={{
            transformStyle: "preserve-3d",
          }}
        >
          🎲
        </motion.div>
        
        {/* Dice faces for 3D effect */}
        <div className="absolute inset-0 pointer-events-none">
          {[1, 2, 3, 4, 5, 6].map((face) => (
            <motion.div
              key={face}
              className="absolute w-full h-full bg-gradient-to-br from-blue-500 to-purple-600 rounded-xl flex items-center justify-center text-white text-lg font-bold opacity-0"
              style={{
                transform: `translateZ(${face * 10}px)`,
              }}
              animate={
                isRolling
                  ? {
                      opacity: [0, 1, 0],
                    }
                  : { opacity: 0 }
              }
              transition={{
                delay: (face - 1) * 0.3,
                duration: 0.3,
              }}
            >
              {face}
            </motion.div>
          ))}
        </div>
      </motion.div>

      <motion.button
        onClick={onRoll}
        disabled={disabled}
        className={`px-8 py-3 rounded-full font-semibold text-white transition-all duration-300 ${
          disabled
            ? 'bg-gray-400 cursor-not-allowed'
            : 'bg-gradient-to-r from-blue-500 to-purple-600 hover:from-blue-600 hover:to-purple-700 shadow-lg hover:shadow-xl'
        }`}
        whileHover={!disabled ? { scale: 1.05 } : {}}
        whileTap={!disabled ? { scale: 0.95 } : {}}
      >
        {isRolling ? 'Rolling...' : 'Roll the Dice'}
      </motion.button>
    </div>
  );
};

export default DiceRoll;