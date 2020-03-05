Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D150B179C9D
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 01:10:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XrkB62n9zDqS9
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 11:10:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XrhV3B1xzDqjZ
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 11:09:14 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 024Nxebh058296
 for <openbmc@lists.ozlabs.org>; Wed, 4 Mar 2020 19:09:12 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yj3esqrsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 04 Mar 2020 19:09:11 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02508J79004830
 for <openbmc@lists.ozlabs.org>; Thu, 5 Mar 2020 00:09:10 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 2yffk6q1xa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Mar 2020 00:09:10 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0250990F54264072
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Mar 2020 00:09:09 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9189124053;
 Thu,  5 Mar 2020 00:09:09 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96763124054;
 Thu,  5 Mar 2020 00:09:09 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  5 Mar 2020 00:09:09 +0000 (GMT)
Subject: Re: OpenBMC GUI Design Workgroup - Today 10:00 AM CST
To: Derick Montague <Derick.Montague@ibm.com>
References: <OF85141839.E61946A0-ON00258521.0044A2A8-00258521.0044A2AE@notes.na.collabserv.com>
 <OF783D8D46.A2308282-ON00258521.0069ADA5-00258521.006A52C8@notes.na.collabserv.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <c7d6f785-755b-1c1c-9ec9-66862a6fedfb@linux.ibm.com>
Date: Wed, 4 Mar 2020 18:09:09 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <OF783D8D46.A2308282-ON00258521.0069ADA5-00258521.006A52C8@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_10:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 phishscore=0 spamscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003040153
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/4/20 1:21 PM, Derick Montague wrote:
> Thank you everyone for the active and productive session today. Below are the notes:
>
>> In today's GUI Design Workgroup, we will will be discussing:
>>
>>
>> - Vue Roadmap progress
>> - Web UI color palette
>> - Documentation progress (alerts, buttons, toasts)
>> - Reference Id table column name in Event Logs
>> - Date and Time design updates
>> - Local User management review
> Road Map
>
> - Reviewed IBM's WIP ZenHub board for their current sprint
>      - Translation progress
>      - Feature toggle to provide support for more upstream development to support different systems
>      - Date and Time research and design
>      - Local user management implementation progress
>      - Reboot BMC implementation
>      - Power server operations is WIP
>      - Overview page using Redfish API to display data
>
> Design story progress and feedback tracking
>
> - Determined that we will continue the pattern for tracking design reviews in a Github story in the webui-vue branch
>      - Github story will contain link to Invision prototype
>      - Comments are best captured in Github, but can be created in Invision as well. Designer will add comments to Github story as needed
>      - Design evolution and final design should be screen captured and added to the Github story where it can be preserved
> - IBM design team will begin this process which will be evaluated for improvements in future workgroup meetings
>
> Color Palette
>
> - IBM has proposed a refined color palette based on the Bootstrap frameworks Theming guidelines (https://gerrit.openbmc-project.xyz/c/openbmc/webui-vue/+/29965)
> - Reviewed the colors and an overview of how they can be easily updated downstream for branding purposes
> - Slightly more extensive color palette to improve the theming of components
> - Full documentation is partially completed explaining customization and the theming process
> - Workgroup was happy with the proposal
>
> Event Logs and the Reference Code column
>
> IBM needs a table column that contains a code the users and customer support can use to troubleshoot issues. The column name was previously based on an IBM proprietary naming. Through user testing the IBM OpenBMC design squad has updated the column title to Reference Id.
>
> - Will not be needed for Intel systems currently
> - Intel systems need ID (currently can be toggled off in Intel GUI), status, and description
> - Intel does not use the Systems Log page that is upstream.
> - Phoenix expressed the need for a solution for improving the experience on small screens and make it easier to view the most important information. All workgroup members agreed this was description.
> - New Event Log design with filter menu had not been seen by the current Workgroup members. IBM will create a Github story and send more requests for feedback to the community.
> - Phoenix suggested not needed a redundant column displayed in the table during filtering, e.g. hide severity column if filter is based on a severity value
> - Determined this may be a future enhancement following priority work in process
> - Need to write the GUI to have a dynamic event log table that only displays a column if present in the JSON response
>      - Another option might be some type of page flag that can be set either globally or in a single file component
>
> Language Translation
>
> - Intel and Phoenix noted that languages should be displayed in the native language, e.g. Spanish should be Español

In addition or as an alternative, consider IETF language tags (for 
example es-419 or en-US) which also encodes regional differences.  A 
number of IBM products use the IETF scheme and differentiate between 
zh-CN and zh-TW.
https://en.wikipedia.org/wiki/Language_code

> - IBM asked for for feedback on or a use case for the user being able to change the language after login since currently the user makes their language preference on the login screen.
>      - Pros for and against. IBM will conduct more research to determine if there is a need and the best pattern for enabling if needed.

My two cents worth:
1. Data should be stored untranslated whenever possible, and translated 
only when it is presented to the user.
2. It seems to me the language preference should ideally be associated 
with the session (whether login session or a session to perform a single 
operation ~ 
https://lists.ozlabs.org/pipermail/openbmc/2019-November/019422.html).

Thanks for keeping track of all this Derick!

- Joseph

>
> Date and Time Design
>
> - Phoenix discussed a "sync to ntp" use case there during setup the system is connected to the internet in order for the admin to connect to an NTP server to set the Host RTC and then disconnect from the internet
>      - Intel noted that they ask admins to update the time in the BIOS to set the Host RTC.
>      - Possible future enhancement
> - Design for Date and Time will allow flexibility for different functionality, e.g IBM systems allow for NTP or manual time entry, while Intel systems offer NTP or RTC only.
> - Need a toggle or flag to allow for both options to live upstream.
>
> Action Items
>
> - Start adding design review stories to Github
>      - Update event logs prototype and send to community
>      - Date and Time
>      - Color palette with alert and toast components
> - Update language menu options to display in native language
>
>
> Review in the wiki: https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group#030420
>   
>   
>   
>

