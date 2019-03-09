function [particles] = particle_generator(nbr_of_states, nbr_of_particles, max, min, seed)

% set random seed
rng(seed);

% preallocate array for speed
particles = zeros(nbr_of_states, nbr_of_particles, 2);

initial_wegihts = 1/nbr_of_particles

% for each state
for index = 1:nbr_of_states
    % perform a unform random dist between min and max values for that
    % state
    particles(index, :, 1) = randi([min(index) max(index)], nbr_of_particles);
    particles(index, :, 2) = initial_wegihts*rand(nbr_of_particles);
end

end

