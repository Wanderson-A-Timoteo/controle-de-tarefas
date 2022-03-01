import React from "react";
import { Text, H5 } from "@adminjs/design-system";
import { Card } from "../styles";

const TaskType = () => {
    return(
        <Card as="a" href="#">
            <Text textAlign="center">
                <H5>Título</H5>
                <Text>Conteúdo</Text>
            </Text>
        </Card>
    );
};

export default TaskType;