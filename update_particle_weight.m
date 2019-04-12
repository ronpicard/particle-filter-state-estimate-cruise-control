function [particles] = update_particle_weight(nbr_of_states,predicted_velocity,measured_v,particles,particle_index,velocity_sigma)
    
    % for each state
    for state = 1:nbr_of_states
        % calculate the likelihood of measured value
        new_weight = abs(measured_v-predicted_velocity)/velocity_sigma;
        % update weight
        particles(state, particle_index, 2) = new_weight;
    end
end

