/*
 * Nostalgia screensaver.
 *
 * Usage:
 *   mount --bind ./screensaver-main.qml /usr/palm/applications/com.webos.app.screensaver/qml/main.qml
 *
 * Test launch (no way to trigger on "No signal" screen)
 *   luna-send -n 1 'luna://com.webos.service.tvpower/power/turnOnScreenSaver' '{}'
 */
import QtQuick 2.4
import Eos.Window 0.1
import QtQuick.Window 2.2

WebOSWindow {
    id: window

    width: 1920
    height: 1080

    windowType: "_WEBOS_WINDOW_TYPE_SCREENSAVER"
    color: "black"

    title: "Screensaver"
    appId: "com.webos.app.screensaver"
    visible: true

    Item {
        id: root

        Rectangle {
            anchors.fill: parent
            color: 'black'
        }

        Rectangle {
            id: boing

            color: 'black'
            width: 320
            height: 163

            function setRandomColor() {
                var colors = ['#f00', '#0f0', '#00f', '#ff0', '#f0f', '#0ff', '#fff'];
                var index = (Math.random() * colors.length) | 0;
                boing.color = colors[index];
            }

            Image {
                anchors.fill: parent
                source: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQAAAABkCAYAAADYWZb/AAAACXBIWXMAAAsTAAALEwEAmpwYAAAGYklEQVR4nO3cQY6kNhCF4ac8czv/f7U5wghSGWWV9G9vDRGy5F3aPjreHZ7Lf8S8MmQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQxMQ3+Kdm21mZYrs9T+5bPj8eGzHXp/9sjFtu+V6Vv+z8tqOfj8XXM4mJvVGWXDP7z7l62cmcmJmYFh35mfbsq6M+d+Yz1vyxPU7/rnvv4rOd7ifHcT+5sbOrOfztQY97Wofjb53N16eW+z9XTr+1PnnflbfF82vUu9fn2PiZmdr4+vLJzXbXplnL3mx/u+x8FyfzXOc/NPNBfn3/bHDPL4z5ef/UlncyU5scyLz7nT77u8tPkeX7yktOpfvu8uHBzOzL+8Zllx1kffHbZffLzP84eaD69/jufrYzmrOjOLvHXfLwdFj6ZY7rVfb47d3cM1q9L+J7b03//kLN5cMvdZf24n/GMt3b9klTP/s13P3f+pTk2N/umWfHVH+34Kz2vxyYH/zNsY63yyfzPP51kfeL2Y1jfS/vzsbqfc/Nc/fHYZfmZ/fzr+vpOtHmt+8z6euXH8XJ/PkTmdz8HRe+vl5QAPvrY97N5Y9P+R+P1Ncyfn4+Z3O3Xcz8/cPDyGfL/6Hp/TTKezsnJ2P1zXByP3MyMjs/j47fXxuOw2NycX+a6OLK7Pee2PL+z0tytbtzE9zf4/LHysbW82+u3n/Lh7r8vls/PaWv9tfPfd6ZnZn3vLM+jnZreP8brZ55wv5flsbn7ywfze3fCyn8uH59lfb6+J2d0/L5yd3br8ntnM9W3L4nf7+fnH+1OX9deR57N53d/W8vJ+Y5Y9/1Gbmc8fHbK92cTGdjfX7zXy+d5J5/dK/YvHZ+en98ePb54/pXZ5Mf7bvl89a3lzO7Ps9nO/t3t3dWH7/FUu+tc/Zr/HY7vvy6KcuP9bX8iZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmfmb+A/DMJr8bbQvzoAAAAASUVORK5CYII="
            Component.onCompleted: {
                boing.setRandomColor();
            }

            SequentialAnimation on x {
                loops: Animation.Infinite
                PropertyAnimation {
                    easing.type: Easing.Linear
                    duration: 1920 * 11
                    to: 1920 - boing.width
                }

                ScriptAction { script: boing.setRandomColor(); }
                PropertyAnimation {
                    easing.type: Easing.Linear
                    duration: 1920 * 11
                    to: 0
                }
                ScriptAction { script: boing.setRandomColor(); }
            }

            SequentialAnimation on y {
                loops: Animation.Infinite
                PropertyAnimation {
                    easing.type: Easing.Linear
                    duration: 1080 * 7
                    to: 1080 - boing.height
                }
                ScriptAction { script: boing.setRandomColor(); }
                PropertyAnimation {
                    easing.type: Easing.Linear
                    duration: 1080 * 7
                    to: 0
                }
                ScriptAction { script: boing.setRandomColor(); }
            }
        }
    }
}
