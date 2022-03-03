//import * as path from 'path';
import AdminJs from 'adminjs';
import Task from '../models/task';
import uploadFeature from '@adminjs/upload';
import credentials from '../config/credentials';

export default {
  resource: Task,
  options: {
    parent: {
      icon: 'Task'
    },
    properties: {
      id: {
        position: 1
      },
      title: {
        position: 2,
        isRequired: true
      },
      description: {
        position: 3,
        isVisible: { list: false, filter: false, show: true, edit: true },
        type: 'richtext',
        props: {
          quill: {
            modules: {
              toolbar: [
                ['bold', 'italic'],
                ['link', 'image']
              ],
            },
          },
        },
      },
      due_date: {
        position: 4
      },
      effort: {
        position: 5
      },
      order: {
        position: 6
      },
      status: {
        position: 7,
        isRequired: true,
        availableValues: [
          { value: "backlog", label: "Diária" },
          { value: "doing", label: "Semanal" },
          { value: "done", label: "Quinzenal" },
          { value: "approved", label: "Mensal" },
          { value: "rejected", label: "Trimestral" },
        ],
      },
      projectId: {
        position: 8,
        isRequired: true,
        isVisible: { list: false, filter: true, show: true, edit: true }
      },
      userId: {
        position: 9,
        isRequired: true,
        isVisible: { list: false, filter: true, show: true, edit: true }
      },
      createdAt: {
        position: 10,
        isVisible: { list: false, filter: true, show: true, edit: false }
      },
      updatedAt: {
        position: 11,
        isVisible: { list: false, filter: true, show: true, edit: false }
      },
      attachment: {
        position: 12
      },
      user_id: {
        isVisible: false
      },
      project_id: {
        isVisible: false
      },
      path: {
        isVisible: false
      },
      folder: {
        isVisible: false
      },
      type: {
        isVisible: false
      },
      filename: {
        isVisible: false
      },
      size: {
        isVisible: false
      },
    },
  },
  features: [
    uploadFeature({
      provider: {
        aws: credentials,
        // local: {
        //   bucket: path.join(__dirname, '../../uploads')
        // }
      },
      properties: {
        key: 'path',
        bucket: 'folder',
        mimeType: 'type',
        size: 'size',
        filename: 'filename',
        file: 'attachment'
      },
      validation: {
        mimeTypes: [
          "image/png",
          "application/pdf",
          "application/zip",
          "image/gif",
          "image/jpeg",
          "application/xml",
          "audio/*",
          "video/mp4",
          "image/svg+xml",
        ],
        maxSize: 5 * 1024 * 1024,
      },
    }),
  ],
};
