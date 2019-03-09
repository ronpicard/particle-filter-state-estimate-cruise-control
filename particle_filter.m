function [particle] = particle_filter(measurements, nbr_of_states, nbr_of_particles, keep_probability, mu, sigma, max, min, debug, seed)


% global particle set (set of state estimates that are estimating a 
% distribution)
global particles;
global current_partcle_idx;

if(isempty(particles))
    particles = particle_generator(nbr_of_states, nbr_of_particles, max, min, seed);
end

for measurment = measurements
    if(debug == True)
        disp(['Measurment: ' measurement]);
    end
end

% udpate weights


% preallocate array
particle = zeros([nbr_of_states, 1]);

current_partcle_idx = particle_idx + 1;
if(current_partcle_idx <= nbr_of_particles)
    % return next particle
    for index = 1:nbr_of_states
        particle(index) = partidcles(index, current_partcle_idx, 1);
    end
elseif(next_particle > nbr_of_particles)
    % resample particle
    particles = particle_resampler(particles, nbr_of_particles, keep_probability, mu, sigma, nbr_of_states);
end

end

