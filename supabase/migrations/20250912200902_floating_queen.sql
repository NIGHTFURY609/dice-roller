/*
  # Create inspiration content tables

  1. New Tables
    - `content_items`
      - `id` (uuid, primary key)
      - `activity` (text) - Activity suggestion with emoji
      - `quote` (text) - Inspirational quote
      - `author` (text) - Quote author
      - `joke` (text) - Funny joke
      - `number_fact` (text) - Interesting number fact
      - `advice` (text) - Life advice
      - `created_at` (timestamp)
      
  2. Security
    - Enable RLS on `content_items` table
    - Add policy for public read access
*/

CREATE TABLE IF NOT EXISTS content_items (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  activity text NOT NULL,
  quote text NOT NULL,
  author text NOT NULL,
  joke text NOT NULL,
  number_fact text NOT NULL,
  advice text NOT NULL,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE content_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read access"
  ON content_items
  FOR SELECT
  TO public
  USING (true);

-- Insert the provided content
INSERT INTO content_items (activity, quote, author, joke, number_fact, advice) VALUES
('Bake a new dessert recipe 🍰', 'Do one thing every day that scares you.', 'Eleanor Roosevelt', 'Parallel lines have so much in common… it''s a shame they''ll never meet.', '1 is the only number divisible by every integer.', 'Take small steps consistently, they add up.'),
('Go for a short bike ride 🚴', 'Happiness is not something ready made. It comes from your own actions.', 'Dalai Lama', 'I told my wife she should embrace her mistakes. She gave me a hug.', '2 is the only even prime number.', 'Say no when you mean no.'),
('Learn a simple card trick 🃏', 'Fall seven times and stand up eight.', 'Japanese Proverb', 'Why did the developer go broke? Because he used up all his cache.', '3 is the number of spatial dimensions we live in.', 'Drink more water before bed.'),
('Try drawing something for 10 minutes 🎨', 'Act as if what you do makes a difference. It does.', 'William James', 'Why don''t skeletons fight each other? They don''t have the guts.', '4 is the number of classical elements (earth, air, fire, water).', 'Turn off notifications for an hour and focus.'),
('Do 10 push-ups 💪', 'Do not wait to strike till the iron is hot, but make it hot by striking.', 'William Butler Yeats', 'Why was the math book sad? Too many problems.', '5 is the number of human senses traditionally recognized.', 'Smile at a stranger today.'),
('Watch a documentary 🎥', 'Opportunities don''t happen. You create them.', 'Chris Grosser', 'How do you comfort a JavaScript bug? You console it.', '6 is the smallest perfect number.', 'Don''t overthink, just start.'),
('Clean one drawer in your room 🧹', 'Great things are done by a series of small things brought together.', 'Van Gogh', 'Why did the computer go to the doctor? It caught a virus.', '1 is the multiplicative identity.', 'Rest when you''re tired, not when you''re done.'),
('Call a friend you haven''t spoken to 📞', 'What you get by achieving your goals is not as important as what you become by achieving your goals.', 'Zig Ziglar', 'Why don''t scientists trust atoms? Because they make up everything.', '2 is the base of binary numbers.', 'Speak kindly, especially when it''s hard.'),
('Learn to cook a new dish 🍳', 'Do not go where the path may lead, go instead where there is no path and leave a trail.', 'Emerson', 'I would tell you a UDP joke… but you might not get it.', '3 is the number of sides on a triangle.', 'Go for a walk after meals.'),
('Meditate for 5 minutes 🧘', 'Peace begins with a smile.', 'Mother Teresa', 'What do you call fake spaghetti? An impasta.', '4 is the number of seasons in a year.', 'Write down what you''re grateful for.'),
('Play your favorite song 🎶', 'In the middle of every difficulty lies opportunity.', 'Albert Einstein', 'Why don''t oysters donate to charity? Because they''re shellfish.', '5 is the number of Olympic rings.', 'Take a deep breath before reacting.'),
('Read 5 pages of a book 📖', 'Your time is limited, so don''t waste it living someone else''s life.', 'Steve Jobs', 'Why don''t programmers like nature? Too many bugs.', '6 is the number of faces on a cube.', 'Plan your tomorrow before sleeping.'),
('Draw a doodle without lifting your pen ✏️', 'You miss 100% of the shots you don''t take.', 'Wayne Gretzky', 'I told my computer I needed a break, and it froze.', '1 is the first odd number.', 'Say thank you more often.'),
('Do 15 squats 🏋️', 'It always seems impossible until it''s done.', 'Nelson Mandela', 'Why did the scarecrow win an award? Because he was outstanding in his field.', '2 is the atomic number of helium.', 'Drink water right now.'),
('Write a 2-line poem ✍️', 'Keep your face always toward the sunshine, and shadows will fall behind you.', 'Walt Whitman', 'Why did the chicken join a band? Because it had the drumsticks.', '3 is the number of rings on Saturn most visible from Earth.', 'Log off social media for an hour.'),
('Try a 2-minute plank ⏱️', 'Doubt kills more dreams than failure ever will.', 'Suzy Kassem', 'Why don''t eggs tell jokes? They''d crack each other up.', '4 is considered unlucky in some Asian cultures.', 'Call your parents today.'),
('Write a bucket list item 📝', 'Be yourself; everyone else is already taken.', 'Oscar Wilde', 'I asked the librarian if the library had books on paranoia… she whispered, ''They''re right behind you.''', '5 is the number of Platonic solids in geometry.', 'Don''t skip breakfast.'),
('Take 10 deep breaths 🌬️', 'Whether you think you can or think you can''t, you''re right.', 'Henry Ford', 'Why can''t your nose be 12 inches long? Because then it would be a foot.', '6 is half a dozen.', 'Stretch after sitting for long hours.'),
('Try origami folding 🦢', 'Don''t let yesterday take up too much of today.', 'Will Rogers', 'Did you hear about the claustrophobic astronaut? He just needed a little space.', '1 is a factorial of itself (1!).', 'Turn your phone off for 30 minutes.'),
('Plant a seed 🌱', 'Life is really simple, but we insist on making it complicated.', 'Confucius', 'I only know 25 letters of the alphabet. I don''t know y.', '2 is the first even number.', 'Compliment someone genuinely.'),
('Learn a new word 📚', 'If you''re going through hell, keep going.', 'Winston Churchill', 'Why don''t crabs give to charity? Because they''re shellfish.', '3 is the minimum sides required to form a polygon.', 'Do something kind for yourself.'),
('Play with your pet 🐶', 'Everything you can imagine is real.', 'Pablo Picasso', 'What do you call cheese that isn''t yours? Nacho cheese.', '4 is the number of DNA bases (A, T, G, C).', 'Go outside and get fresh air.'),
('Try a new podcast 🎧', 'Believe you can and you''re halfway there.', 'Theodore Roosevelt', 'I made a pencil with two erasers. It was pointless.', '5 is the number of digits on one hand.', 'Don''t rush, go steady.'),
('Do a quick sketch 🎨', 'Success is not final, failure is not fatal: it is the courage to continue that counts.', 'Winston Churchill', 'Why did the golfer bring two pairs of pants? In case he got a hole in one.', '6 is the atomic number of carbon.', 'Laugh at least once today.'),
('Play a board game 🎲', 'Dream big and dare to fail.', 'Norman Vaughan', 'Why don''t programmers like outdoors? There are too many bugs.', '1 is the first positive integer.', 'Be patient, things take time.'),
('Do a random act of kindness 🤝', 'Do what you can, with what you have, where you are.', 'Theodore Roosevelt', 'Did you hear about the guy who invented Lifesavers? He made a mint.', '2 is the number of eyes most humans have.', 'Put your goals somewhere visible.'),
('Sing along to a song 🎤', 'Keep going. Everything you need will come to you at the perfect time.', 'Unknown', 'Why was the stadium so hot? All the fans left.', '3 is the number of primary colors.', 'Take a short nap if you''re tired.'),
('Organize your desktop 🖥️', 'It does not matter how slowly you go as long as you do not stop.', 'Confucius', 'Why do cows wear bells? Because their horns don''t work.', '4 is the number of Beatles in the band.', 'Listen more than you speak.'),
('Learn a dance move 💃', 'The journey of a thousand miles begins with a single step.', 'Lao Tzu', 'I''m reading a book on anti-gravity. It''s impossible to put down.', '5 is the Fibonacci sequence''s 5th number.', 'Celebrate small wins.'),
('Try a new online tool or app 💻', 'Courage is grace under pressure.', 'Ernest Hemingway', 'Why don''t seagulls fly over the bay? Because then they''d be bagels.', '6 is the number of strings on a standard guitar.', 'End your day with reflection.');