Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C58169E90
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 07:38:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48QspS3RCnzDqTQ
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 17:38:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Qsng6llTzDqSs
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 17:37:58 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01O6ZE86129841
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 01:37:55 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yb12ach36-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 01:37:54 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Mon, 24 Feb 2020 06:37:53 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 24 Feb 2020 06:37:50 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01O6bnmi59572306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 06:37:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EB7F4C040;
 Mon, 24 Feb 2020 06:37:49 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 518A54C046;
 Mon, 24 Feb 2020 06:37:48 +0000 (GMT)
Received: from [9.202.14.113] (unknown [9.202.14.113])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 24 Feb 2020 06:37:48 +0000 (GMT)
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Re: Redfish EventService Implementation
To: openbmc@lists.ozlabs.org, "Puli, Apparao" <apparao.puli@linux.intel.com>
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <7a3d4141-ff5f-794a-6803-88a8bcfa3e02@gmail.com>
 <1a22b091-675c-3e1d-b57a-d44b3ba5d4e0@linux.intel.com>
Date: Mon, 24 Feb 2020 12:07:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1a22b091-675c-3e1d-b57a-d44b3ba5d4e0@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="------------A852F7C3E3AF3411852BF487"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20022406-0008-0000-0000-00000355D167
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022406-0009-0000-0000-00004A76E8AF
Message-Id: <813853bb-b3a3-79a7-94c5-bbe487c2902b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-24_01:2020-02-21,
 2020-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240057
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------A852F7C3E3AF3411852BF487
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Apparao,

On 2/20/20 12:49 AM, Puli, Apparao wrote:
> Hi,
>
>   I am sorry for late response as this mail is buried under and got 
> struck back of my mind.
>
> As i did mentioned in EventService design document, EventLog Monitor 
> service is not common across the organizations( Example: Intel uses 
> the redfish event logs file and inotify mechanism for monitoring the 
> event logs. Where as IBM uses d-bus event log mechanism and they can 
> relay on match rules). That said challenges with ResourceType mapping 
> will be different in both monitoring mechanisms. This is good point. 
> Initially when i started EventService design, i thought we can have 
> mapping in bmcweb for ResourceTypes with set of MessageID's for Logged 
> events ( As per Intel design) but not sure that may become difficult 
> when we expand supported ResourceTypes.

If I am getting correctly, Here is the flow which Intel uses.

 1. Individual repo have to push the logs using sd_journal_send which
    will write to the file(/var/log/redfish) by using rsyslog daemon

sd_journal_send("MESSAGE=%s","journal text","PRIORITY=%i", <LOG_LEVEL>,
                 "REDFISH_MESSAGE_ID=%s",
                 "ResourceEvent.1.0.ResourceCreated",NULL);

      * How you would populate the "OriginOfCondition" during sending of
        event? (https://redfish.dmtf.org/schemas/v1/Event.v1_4_1.json)

      * Any plan to add resource path in this journal message which
        tells that this is the path for which resource created event
        generated.

      * Would the path be "Redfish Path/ D-bus Path"?

      * Where the mapping would be done between D-busPath/Redfish
        Resource path?

     
          Cons: Every application have to make the change(use sd_journal_send).
          My thought is backend application should not be aware of the redfish terminlogy.

*2.* Some application(bmcweb) would do the Inotify on the 
path(/var/log/redfish) and send the event once there is any activity on 
this file.

> I thought we can have mapping in bmcweb for ResourceTypes with set of MessageID's for Logged events ( As 
per Intel design)

     Can you explain more here. What is your plan? How you would do the Resource Type based event filtering?REDFISH_MESSAGE_ID is different than the resource type.

>
> As per my reading from below query, You are looking at d-bus match 
> rules and ResourceTypes mapping which is more specific to d-bus event 
> logging(IBM way of implementing event logging). reading it from 
> journal logs will give more information but that will impact the 
> performance to large extent. This might be one of the reason why we 
> (Intel) uses Redfish message ID while logging redfish events logs to 
> journal(You can refer design document for same at 
> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md). 
> In opinion, in your d-bus if you are using some kind of filter(Example 
> REDFISH_MESSAGE_ID) while logging in journal logs for all events and 
> figure out the way to monitor the journal logs without impacting the 
> performance, that should be ok as long as match filters are satisfied 
> for Redfish EventService subscriptions and supported Types(Again 
> differs with implementation).
>
> Thanks,
>
> -Appu
>
> On 2/10/2020 1:52 AM, RAJESWARAN THILLAIGOVINDAN wrote:
>> ApparaRao.
>>
>> As you have shown interest in this feature and submitted the design 
>> document, do you have any opinion on this? Do you see any merit in 
>> using D-Bus match in bmcweb to create event logs for life cycle 
>> events?  Please feel free to weigh in.
>>
>> Thanks,
>> Rajes
>>
>> On 01-02-2020 02:23, RAJESWARAN THILLAIGOVINDAN wrote:
>>> Hi,
>>>
>>> I am going through the bmcweb code for implementing Redfish 
>>> EventService based on the design document 
>>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749. This 
>>> design is hooked to the journal based Redfish Event Logging. For 
>>> life cycle events(ResourceAdded, ResourceRemoved, ResourceUpdated),  
>>> using D-Bus match, bmcweb can create an event log. This requires a 
>>> JSON dictionary, comprising an array of Redfish Resource Name and 
>>> the D-Bus path. This approach works only in case of one to one 
>>> mapping of Redfish Resource Name and the D-Bus path. For 
>>> propertiesChanged events, if the Redfish Resource property is not on 
>>> the same D-Bus path or the Redfish Resource property name is 
>>> different from the D-Bus property name, then an additional JSON 
>>> dictionary to maintain this information is required. With D-Bus 
>>> match alone in the bmcweb, Redfish EventService can't be fully 
>>> supported. For the Message Registers and the Resource Types that are 
>>> supported, the relevant OpenBMC application must create an event log 
>>> in the journal using either the phosphor::logging::entry or 
>>> sd_journal_send() command.
>>>
>>> After realizing that with D-Bus match in the bmcweb alone can't help 
>>> to fully implement EventService, I prefer to avoid using D-Bus match 
>>> in bmcweb. Instead, I prefer to modify the OpenBMC application that 
>>> generated the event to create an event log in the journal. Do you 
>>> see any advantage of using combination of D-Bus match in the bmcweb 
>>> wherever it is possible and changes to OpenBMC application in other 
>>> cases to create an event log ?
>>>
>>> Your views are highly appreciated.
>>>
>>> Thanks,
>>> Rajes
>>
Thanks
Ratan



--------------A852F7C3E3AF3411852BF487
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Apparao,</p>
    <div class="moz-cite-prefix">On 2/20/20 12:49 AM, Puli, Apparao
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1a22b091-675c-3e1d-b57a-d44b3ba5d4e0@linux.intel.com">Hi,
      <br>
      <br>
        I am sorry for late response as this mail is buried under and
      got struck back of my mind. <br>
      <br>
      As i did mentioned in EventService design document, EventLog
      Monitor service is not common across the organizations( Example:
      Intel uses the redfish event logs file and inotify mechanism for
      monitoring the event logs. Where as IBM uses d-bus event log
      mechanism and they can relay on match rules). That said challenges
      with ResourceType mapping will be different in both monitoring
      mechanisms. This is good point. Initially when i started
      EventService design, i thought we can have mapping in bmcweb for
      ResourceTypes with set of MessageID's for Logged events ( As per
      Intel design) but not sure that may become difficult when we
      expand supported ResourceTypes. <br>
    </blockquote>
    <p><tt>If I am getting correctly, Here is the flow which Intel uses.</tt></p>
    <ol>
      <li><tt>Individual repo have to push the logs using
          sd_journal_send which will write to the file(/var/log/redfish)
          by using rsyslog daemon</tt></li>
    </ol>
    <pre><span class="pl-en">          sd_journal_send</span>(<span class="pl-s"><span class="pl-pds">"</span>MESSAGE=%s<span class="pl-pds">"</span></span>, <span class="pl-s"><span class="pl-pds">"</span>journal text<span class="pl-pds">"</span></span>, <span class="pl-s"><span class="pl-pds">"</span>PRIORITY=%i<span class="pl-pds">"</span></span>, &lt;LOG_LEVEL&gt;,
                <span class="pl-s"><span class="pl-pds">"</span>REDFISH_MESSAGE_ID=%s<span class="pl-pds">"</span></span>,
                <span class="pl-s"><span class="pl-pds">"</span>ResourceEvent.1.0.ResourceCreated<span class="pl-pds">"</span></span>, <span class="pl-c1">NULL</span>);

</pre>
    <blockquote>
      <ul>
        <li> <tt>How you would populate the "</tt><tt><span
              class="treeLabel objectLabel" aria-labelledby="default"
              data-level="3">OriginOfCondition</span></tt><tt>" during
            sending of event? (<a class="moz-txt-link-freetext"
              href="https://redfish.dmtf.org/schemas/v1/Event.v1_4_1.json">https://redfish.dmtf.org/schemas/v1/Event.v1_4_1.json</a>)</tt></li>
      </ul>
    </blockquote>
    <blockquote>
      <ul>
        <li><tt> Any plan to add resource path in this journal message
            which tells that this is the path for which resource created
            event generated.</tt></li>
      </ul>
    </blockquote>
    <blockquote>
      <ul>
        <li><tt> Would the path be "Redfish Path/ D-bus Path"?</tt></li>
      </ul>
    </blockquote>
    <blockquote>
      <ul>
        <li><tt> Where the mapping would be done between
            D-busPath/Redfish Resource path?</tt></li>
      </ul>
    </blockquote>
    <pre>    
         Cons: Every application have to make the change(use sd_journal_send).
         My thought is backend application should not be aware of the redfish terminlogy. 

</pre>
    <p><tt>  <b> 2.</b> Some application(bmcweb) would do the Inotify on
        the path(/var/log/redfish) and send the event once there is any
        activity on this file.</tt></p>
    <pre>&gt; I thought we can have mapping in bmcweb for ResourceTypes with set of MessageID's for Logged events ( As 
per Intel design)

    Can you explain more here. What is your plan? How you would do the Resource Type based event filtering? <span class="pl-s">REDFISH_MESSAGE_ID is different than the resource type.</span>
<span class="pl-s"><span class="pl-pds"></span></span><span class="pl-s"></span></pre>
    <blockquote type="cite"
      cite="mid:1a22b091-675c-3e1d-b57a-d44b3ba5d4e0@linux.intel.com"> <br>
      As per my reading from below query, You are looking at d-bus match
      rules and ResourceTypes mapping which is more specific to d-bus
      event logging(IBM way of implementing event logging). reading it
      from journal logs will give more information but that will impact
      the performance to large extent. This might be one of the reason
      why we (Intel) uses Redfish message ID while logging redfish
      events logs to journal(You can refer design document for same at
      <a class="moz-txt-link-freetext"
href="https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md">https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md</a>).
      In opinion, in your d-bus if you are using some kind of
      filter(Example REDFISH_MESSAGE_ID) while logging in journal logs
      for all events and figure out the way to monitor the journal logs
      without impacting the performance, that should be ok as long as
      match filters are satisfied for Redfish EventService subscriptions
      and supported Types(Again differs with implementation). <br>
      <br>
      Thanks, <br>
      <br>
      -Appu <br>
      <br>
      On 2/10/2020 1:52 AM, RAJESWARAN THILLAIGOVINDAN wrote: <br>
      <blockquote type="cite">ApparaRao. <br>
        <br>
        As you have shown interest in this feature and submitted the
        design document, do you have any opinion on this? Do you see any
        merit in using D-Bus match in bmcweb to create event logs for
        life cycle events?  Please feel free to weigh in. <br>
        <br>
        Thanks, <br>
        Rajes <br>
        <br>
        On 01-02-2020 02:23, RAJESWARAN THILLAIGOVINDAN wrote: <br>
        <blockquote type="cite">Hi, <br>
          <br>
          I am going through the bmcweb code for implementing Redfish
          EventService based on the design document <a
            class="moz-txt-link-freetext"
            href="https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749">https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749</a>.
          This design is hooked to the journal based Redfish Event
          Logging. For life cycle events(ResourceAdded, ResourceRemoved,
          ResourceUpdated),  using D-Bus match, bmcweb can create an
          event log. This requires a JSON dictionary, comprising an
          array of Redfish Resource Name and the D-Bus path. This
          approach works only in case of one to one mapping of Redfish
          Resource Name and the D-Bus path. For propertiesChanged
          events, if the Redfish Resource property is not on the same
          D-Bus path or the Redfish Resource property name is different
          from the D-Bus property name, then an additional JSON
          dictionary to maintain this information is required. With
          D-Bus match alone in the bmcweb, Redfish EventService can't be
          fully supported. For the Message Registers and the Resource
          Types that are supported, the relevant OpenBMC application
          must create an event log in the journal using either the
          phosphor::logging::entry or sd_journal_send() command. <br>
          <br>
          After realizing that with D-Bus match in the bmcweb alone
          can't help to fully implement EventService, I prefer to avoid
          using D-Bus match in bmcweb. Instead, I prefer to modify the
          OpenBMC application that generated the event to create an
          event log in the journal. Do you see any advantage of using
          combination of D-Bus match in the bmcweb wherever it is
          possible and changes to OpenBMC application in other cases to
          create an event log ? <br>
          <br>
          Your views are highly appreciated. <br>
          <br>
          Thanks, <br>
          Rajes <br>
        </blockquote>
        <br>
      </blockquote>
    </blockquote>
    Thanks<br>
    Ratan<br>
    <p><br>
    </p>
  </body>
</html>

--------------A852F7C3E3AF3411852BF487--

