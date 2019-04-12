function [particles] = particle_generator(particles,nbr_of_states, nbr_of_particles, max, min, seed)

% set random seed
rng(seed);

% preallocate array for speed
%particles = zeros(nbr_of_states, nbr_of_particles, 2);

% for each state
for index = 1:nbr_of_states
    % perform a unform random dist between min and max values for that
    % state
    particles(index, :, 1) = (max(index) - min(index))* rand(nbr_of_particles,1) + min(index); % particles
    particles(index, :, 2) = rand(nbr_of_particles,1); % particle weight
end

end

