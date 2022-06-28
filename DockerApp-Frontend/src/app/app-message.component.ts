import { Component, OnInit } from '@angular/core';
import { MessageService } from './message.service';

@Component({
  selector: 'app-message',
  templateUrl: './app-message.component.html',
  styleUrls: ['./app-message.component.css']
})
export class AppMessageComponent implements OnInit {
  
  constructor(public messageService: MessageService) {}

  ngOnInit() {
  }

}
