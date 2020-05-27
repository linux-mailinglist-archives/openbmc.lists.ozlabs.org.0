Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C46A1E36C1
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 05:55:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Wxmz1yqGzDqMf
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 13:55:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=apparao.puli@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WxdW11sJzDqJs
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 13:48:42 +1000 (AEST)
IronPort-SDR: i8+OU4p7de7E7RFeyM8Ing2tORHJMi3LqYCWJ3JAXOVoM5nl3EZ1stpD6q8WzWwYLN+NhNcg5l
 d0wgYDe5zglA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 20:48:39 -0700
IronPort-SDR: 8PkK+gz9WMTfudQ9mlny7NP85Sc5eHobS1cRVOixI1Rz9auccqY3d5qsoEG2C0M/2mqj5x0RO6
 b/qWtlg2zhPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,439,1583222400"; 
 d="scan'208,217";a="284663185"
Received: from apuli-mobl.gar.corp.intel.com (HELO [10.213.101.191])
 ([10.213.101.191])
 by orsmga002.jf.intel.com with ESMTP; 26 May 2020 20:48:37 -0700
Subject: Re: Redfish EventService Implementation
To: RAJESWARAN THILLAIGOVINDAN <rajeswaran.thillaigovindan@gmail.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <7a3d4141-ff5f-794a-6803-88a8bcfa3e02@gmail.com>
 <1a22b091-675c-3e1d-b57a-d44b3ba5d4e0@linux.intel.com>
 <813853bb-b3a3-79a7-94c5-bbe487c2902b@linux.vnet.ibm.com>
 <d27f94a5-7195-422a-9442-9e5e3e0aaae7@linux.intel.com>
 <23e93766-980b-2bd1-fc8c-bb5c18b962eb@gmail.com>
From: "Puli, Apparao" <apparao.puli@linux.intel.com>
Message-ID: <ea71f5a6-1e63-9e04-f0ab-edbbce1ec162@linux.intel.com>
Date: Wed, 27 May 2020 09:18:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <23e93766-980b-2bd1-fc8c-bb5c18b962eb@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------8BE8112A3B131FA5F771D4DC"
Content-Language: en-US
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
--------------8BE8112A3B131FA5F771D4DC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rajeswaran,

   Thanks for your mail. At the moment, I don't have plans to support 
the "ResourceTypes", "OriginResources" based filtering. Basically Intel 
uses file systems based redfish event logs( journalctl -> rsync-> 
filesystem) and doesn't use D-Bus mechanism like IBM uses. So I am not 
much familiar with D-Bus logging but some of the suggestions:

  1) While logging redfish events over D-Bus itself,  it can provide 
details on ResourceTypes and OriginResource URI/Path.

      This is ideal and most efficient way. Since  we walked a walked 
long distance from start, Its hard to modify all the services to uses 
these 2 new input parameters while logging events( Requires change in 
almost all repo's)

2) For resourcesTypes: Can have mapping dictionary against all 
MessageId's. For OriginResources: I believe, event log over D-Bus is 
already holding the Path. If so, last 3/4 nodes of uri can be taken and 
mapped against the resources and that can be used in Event filtering. We 
did used same mechanism in case of telemetry while mapping 
MetricReportDefinitions to URI.

Hope this helps.

Thanks,

-Appu


On 5/26/2020 5:50 PM, RAJESWARAN THILLAIGOVINDAN wrote:
>
> Apparao,
>
> I see that you have uploaded a 
> patch(https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/32441) for 
> supporting server sent events. This patch supports event filtering 
> based on registry prefix  and/or messageId.
>
> I would like to know if you have any plan to support event filtering 
> based on resource type. If so, I would like to work together for a 
> better solution. Earlier, I have proposed a solution based on D-Bus 
> match using a dictionary. With that approach, the major challenge is 
> to map Redfish resource and properties to D-Bus object and properties 
> respectively.   If D-Bus applications are modified to include resource 
> type and origin of condition in the event, then there is no need for a 
> map. But,that brings Redfish terminology to the application. Also, 
> this will become an overhead if an OEM is not interested in Redfish 
> event service.
>
> Thanks,
> Rajes
> On 25-02-2020 19:36, Puli, Apparao wrote:
>>
>> Hi Ratan,
>>
>>    Comments in-line
>>
>> On 2/24/2020 12:07 PM, Ratan Gupta wrote:
>>>
>>> Hi Apparao,
>>>
>>> On 2/20/20 12:49 AM, Puli, Apparao wrote:
>>>> Hi,
>>>>
>>>>   I am sorry for late response as this mail is buried under and got 
>>>> struck back of my mind.
>>>>
>>>> As i did mentioned in EventService design document, EventLog 
>>>> Monitor service is not common across the organizations( Example: 
>>>> Intel uses the redfish event logs file and inotify mechanism for 
>>>> monitoring the event logs. Where as IBM uses d-bus event log 
>>>> mechanism and they can relay on match rules). That said challenges 
>>>> with ResourceType mapping will be different in both monitoring 
>>>> mechanisms. This is good point. Initially when i started 
>>>> EventService design, i thought we can have mapping in bmcweb for 
>>>> ResourceTypes with set of MessageID's for Logged events ( As per 
>>>> Intel design) but not sure that may become difficult when we expand 
>>>> supported ResourceTypes.
>>>
>>> If I am getting correctly, Here is the flow which Intel uses.
>>>
>>>  1. Individual repo have to push the logs using sd_journal_send
>>>     which will write to the file(/var/log/redfish) by using rsyslog
>>>     daemon
>>>
>>> sd_journal_send("MESSAGE=%s","journal text","PRIORITY=%i", <LOG_LEVEL>,
>>>                  "REDFISH_MESSAGE_ID=%s",
>>>                  "ResourceEvent.1.0.ResourceCreated",NULL);
>>>
>>>       * How you would populate the "OriginOfCondition" during
>>>         sending of event?
>>>         (https://redfish.dmtf.org/schemas/v1/Event.v1_4_1.json)
>>>
>> Currently in logServices( logEntry),  we are not reporting the 
>> "OriginOfCondition" property as per schema. I will check with Jason( 
>> Who wrote the logService) and get back on this.
>>
>> BTW can you give me how this information is fetched in IBM way of 
>> LogService implementation( D-Bus)? If you already ratified any such, 
>> i think we can leverage.  If not, We work together for solution.
>>
>>>       * Any plan to add resource path in this journal message which
>>>         tells that this is the path for which resource created event
>>>         generated.
>>>
>> Same as above.
>>>
>>>       * Would the path be "Redfish Path/ D-bus Path"?
>>>
>> As per Redfish specification, This should be "@odata.id" which means 
>> it should be of resource uri and so we can't use d-bus path here for 
>> OriginOfConditions.
>>>
>>>       * Where the mapping would be done between D-busPath/Redfish
>>>         Resource path?
>>>
>>>      
>>>           Cons: Every application have to make the change(use sd_journal_send).
>>>           My thought is backend application should not be aware of the redfish terminlogy.
>>
>> Having separate process only for this mapping may not be good( No 
>> different from maintaining that map inside bmcweb as there won't be 
>> any other consumers). Ideal way is, that should be mapped while 
>> logging logEntry's itself. But we are not doing it currently which 
>> need to be re-looked. Give me some time, I will think and check with 
>> other folks and get back.
>>
>>> *2.* Some application(bmcweb) would do the Inotify on the 
>>> path(/var/log/redfish) and send the event once there is any activity 
>>> on this file.
>>>
>>> > I thought we can have mapping in bmcweb for ResourceTypes with set of MessageID's for Logged events ( As 
>>> per Intel design)
>>>
>>>      Can you explain more here. What is your plan? How you would do the Resource Type based event filtering?REDFISH_MESSAGE_ID is different than the resource type.
>> Initially i thought "ResourceType" based event filtering can be done 
>> using minimal mapping( Using MessageID and args). But that will work 
>> for minimal set. If the supported ResourceTypes grows, we will have 
>> bigger challenges which i can sense it now. Anyway, Supported 
>> Resources are completely implementation specific. If this value is 
>> empty means, by default all event logs will be sent to subscribers. 
>> This is what we can start with before supported  ResourceTypes list 
>> grows.
>>>>
>>>> As per my reading from below query, You are looking at d-bus match 
>>>> rules and ResourceTypes mapping which is more specific to d-bus 
>>>> event logging(IBM way of implementing event logging). reading it 
>>>> from journal logs will give more information but that will impact 
>>>> the performance to large extent. This might be one of the reason 
>>>> why we (Intel) uses Redfish message ID while logging redfish events 
>>>> logs to journal(You can refer design document for same at 
>>>> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md). 
>>>> In opinion, in your d-bus if you are using some kind of 
>>>> filter(Example REDFISH_MESSAGE_ID) while logging in journal logs 
>>>> for all events and figure out the way to monitor the journal logs 
>>>> without impacting the performance, that should be ok as long as 
>>>> match filters are satisfied for Redfish EventService subscriptions 
>>>> and supported Types(Again differs with implementation).
>>>>
>>>> Thanks,
>>>>
>>>> -Appu
>>>>
>>>> On 2/10/2020 1:52 AM, RAJESWARAN THILLAIGOVINDAN wrote:
>>>>> ApparaRao.
>>>>>
>>>>> As you have shown interest in this feature and submitted the 
>>>>> design document, do you have any opinion on this? Do you see any 
>>>>> merit in using D-Bus match in bmcweb to create event logs for life 
>>>>> cycle events?  Please feel free to weigh in.
>>>>>
>>>>> Thanks,
>>>>> Rajes
>>>>>
>>>>> On 01-02-2020 02:23, RAJESWARAN THILLAIGOVINDAN wrote:
>>>>>> Hi,
>>>>>>
>>>>>> I am going through the bmcweb code for implementing Redfish 
>>>>>> EventService based on the design document 
>>>>>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749. This 
>>>>>> design is hooked to the journal based Redfish Event Logging. For 
>>>>>> life cycle events(ResourceAdded, ResourceRemoved, 
>>>>>> ResourceUpdated),  using D-Bus match, bmcweb can create an event 
>>>>>> log. This requires a JSON dictionary, comprising an array of 
>>>>>> Redfish Resource Name and the D-Bus path. This approach works 
>>>>>> only in case of one to one mapping of Redfish Resource Name and 
>>>>>> the D-Bus path. For propertiesChanged events, if the Redfish 
>>>>>> Resource property is not on the same D-Bus path or the Redfish 
>>>>>> Resource property name is different from the D-Bus property name, 
>>>>>> then an additional JSON dictionary to maintain this information 
>>>>>> is required. With D-Bus match alone in the bmcweb, Redfish 
>>>>>> EventService can't be fully supported. For the Message Registers 
>>>>>> and the Resource Types that are supported, the relevant OpenBMC 
>>>>>> application must create an event log in the journal using either 
>>>>>> the phosphor::logging::entry or sd_journal_send() command.
>>>>>>
>>>>>> After realizing that with D-Bus match in the bmcweb alone can't 
>>>>>> help to fully implement EventService, I prefer to avoid using 
>>>>>> D-Bus match in bmcweb. Instead, I prefer to modify the OpenBMC 
>>>>>> application that generated the event to create an event log in 
>>>>>> the journal. Do you see any advantage of using combination of 
>>>>>> D-Bus match in the bmcweb wherever it is possible and changes to 
>>>>>> OpenBMC application in other cases to create an event log ?
>>>>>>
>>>>>> Your views are highly appreciated.
>>>>>>
>>>>>> Thanks,
>>>>>> Rajes
>>>>>
>>> Thanks
>>> Ratan
>>>
>>>

--------------8BE8112A3B131FA5F771D4DC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Rajeswaran,</p>
    <p>  Thanks for your mail. At the moment, I don't have plans to
      support the "ResourceTypes", "OriginResources" based filtering. 
      Basically Intel uses file systems based redfish event logs(
      journalctl -&gt; rsync-&gt; filesystem) and doesn't use D-Bus
      mechanism like IBM uses. So I am not much familiar with D-Bus
      logging but some of the suggestions:</p>
    <p> 1) While logging redfish events over D-Bus itself,  it can
      provide details on ResourceTypes and OriginResource URI/Path. <br>
    </p>
    <p>     This is ideal and most efficient way. Since  we walked a
      walked long distance from start, Its hard to modify all the
      services to uses these 2 new input parameters while logging
      events( Requires change in almost all repo's)<br>
    </p>
    <p>2) For resourcesTypes: Can have mapping dictionary against all
      MessageId's. For OriginResources: I believe, event log over D-Bus
      is already holding the Path. If so, last 3/4 nodes of uri can be
      taken and mapped against the resources and that can be used in
      Event filtering. We did used same mechanism in case of telemetry 
      while mapping MetricReportDefinitions to URI.</p>
    <p>Hope this helps.</p>
    <p>Thanks,</p>
    <p>-Appu  <br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/26/2020 5:50 PM, RAJESWARAN
      THILLAIGOVINDAN wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:23e93766-980b-2bd1-fc8c-bb5c18b962eb@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>Apparao, <br>
      </p>
      <p>I see that you have uploaded a patch(<a
          class="moz-txt-link-freetext"
          href="https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/32441"
          moz-do-not-send="true">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/32441</a>)
        for supporting server sent events. This patch supports event
        filtering based on registry prefix  and/or messageId.  <br>
      </p>
      <p>I would like to know if you have any plan to support event
        filtering based on resource type. If so, I would like to work
        together for a better solution. Earlier, I have proposed a
        solution based on D-Bus match using a dictionary. With that
        approach, the major challenge is to map Redfish resource and
        properties to D-Bus object and properties respectively.   If
        D-Bus applications are modified to include resource type and
        origin of condition in the event, then there is no need for a
        map. But,that brings Redfish terminology to the application.
        Also, this will become an overhead if an OEM is not interested
        in Redfish event service. <br>
      </p>
      Thanks,<br>
      Rajes<br>
      <div class="moz-cite-prefix">On 25-02-2020 19:36, Puli, Apparao
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:d27f94a5-7195-422a-9442-9e5e3e0aaae7@linux.intel.com">
        <meta http-equiv="Content-Type" content="text/html;
          charset=UTF-8">
        <p>Hi Ratan,</p>
        <p>   Comments in-line<br>
        </p>
        <div class="moz-cite-prefix">On 2/24/2020 12:07 PM, Ratan Gupta
          wrote:<br>
        </div>
        <blockquote type="cite"
          cite="mid:813853bb-b3a3-79a7-94c5-bbe487c2902b@linux.vnet.ibm.com">
          <meta http-equiv="Content-Type" content="text/html;
            charset=UTF-8">
          <p>Hi Apparao,</p>
          <div class="moz-cite-prefix">On 2/20/20 12:49 AM, Puli,
            Apparao wrote:<br>
          </div>
          <blockquote type="cite"
            cite="mid:1a22b091-675c-3e1d-b57a-d44b3ba5d4e0@linux.intel.com">Hi,
            <br>
            <br>
              I am sorry for late response as this mail is buried under
            and got struck back of my mind. <br>
            <br>
            As i did mentioned in EventService design document, EventLog
            Monitor service is not common across the organizations(
            Example: Intel uses the redfish event logs file and inotify
            mechanism for monitoring the event logs. Where as IBM uses
            d-bus event log mechanism and they can relay on match
            rules). That said challenges with ResourceType mapping will
            be different in both monitoring mechanisms. This is good
            point. Initially when i started EventService design, i
            thought we can have mapping in bmcweb for ResourceTypes with
            set of MessageID's for Logged events ( As per Intel design)
            but not sure that may become difficult when we expand
            supported ResourceTypes. <br>
          </blockquote>
          <p><tt>If I am getting correctly, Here is the flow which Intel
              uses.</tt></p>
          <ol>
            <li><tt>Individual repo have to push the logs using
                sd_journal_send which will write to the
                file(/var/log/redfish) by using rsyslog daemon</tt></li>
          </ol>
          <pre><span class="pl-en">          sd_journal_send</span>(<span class="pl-s"><span class="pl-pds">"</span>MESSAGE=%s<span class="pl-pds">"</span></span>, <span class="pl-s"><span class="pl-pds">"</span>journal text<span class="pl-pds">"</span></span>, <span class="pl-s"><span class="pl-pds">"</span>PRIORITY=%i<span class="pl-pds">"</span></span>, &lt;LOG_LEVEL&gt;,
                <span class="pl-s"><span class="pl-pds">"</span>REDFISH_MESSAGE_ID=%s<span class="pl-pds">"</span></span>,
                <span class="pl-s"><span class="pl-pds">"</span>ResourceEvent.1.0.ResourceCreated<span class="pl-pds">"</span></span>, <span class="pl-c1">NULL</span>);

</pre>
          <blockquote>
            <ul>
              <li> <tt>How you would populate the "</tt><tt><span
                    class="treeLabel objectLabel"
                    aria-labelledby="default" data-level="3">OriginOfCondition</span></tt><tt>"
                  during sending of event? (<a
                    class="moz-txt-link-freetext"
                    href="https://redfish.dmtf.org/schemas/v1/Event.v1_4_1.json"
                    moz-do-not-send="true">https://redfish.dmtf.org/schemas/v1/Event.v1_4_1.json</a>)</tt></li>
            </ul>
          </blockquote>
        </blockquote>
        <p><tt>Currently in logServices( logEntry),  we are not
            reporting the "OriginOfCondition" property as per schema. I
            will check with Jason( Who wrote the logService) and get
            back on this.</tt></p>
        <p><tt>BTW can you give me how this information is fetched in
            IBM way of LogService implementation( D-Bus)? If you already
            ratified any such, i think we can leverage.  If not, We work
            together for solution. <br>
          </tt></p>
        <blockquote type="cite"
          cite="mid:813853bb-b3a3-79a7-94c5-bbe487c2902b@linux.vnet.ibm.com">
          <blockquote>
            <ul>
            </ul>
          </blockquote>
          <blockquote>
            <ul>
              <li><tt> Any plan to add resource path in this journal
                  message which tells that this is the path for which
                  resource created event generated.</tt></li>
            </ul>
          </blockquote>
        </blockquote>
        <tt>Same as above.</tt><br>
        <blockquote type="cite"
          cite="mid:813853bb-b3a3-79a7-94c5-bbe487c2902b@linux.vnet.ibm.com">
          <blockquote>
            <ul>
            </ul>
          </blockquote>
          <blockquote>
            <ul>
              <li><tt> Would the path be "Redfish Path/ D-bus Path"?</tt></li>
            </ul>
          </blockquote>
        </blockquote>
        As per Redfish specification, This should be "@odata.id" which
        means it should be of resource uri and so we can't use d-bus
        path here for OriginOfConditions.<br>
        <blockquote type="cite"
          cite="mid:813853bb-b3a3-79a7-94c5-bbe487c2902b@linux.vnet.ibm.com">
          <blockquote>
            <ul>
              <li><tt>Where the mapping would be done between
                  D-busPath/Redfish Resource path?</tt></li>
            </ul>
          </blockquote>
          <pre>    
         Cons: Every application have to make the change(use sd_journal_send).
         My thought is backend application should not be aware of the redfish terminlogy.</pre>
        </blockquote>
        <p>Having separate process only for this mapping may not be
          good( No different from maintaining that map inside bmcweb as
          there won't be any other consumers). Ideal way is, that should
          be mapped while logging logEntry's itself. But we are not
          doing it currently which need to be re-looked. Give me some
          time, I will think and check with other folks and get back.<br>
        </p>
        <blockquote type="cite"
          cite="mid:813853bb-b3a3-79a7-94c5-bbe487c2902b@linux.vnet.ibm.com">
          <p><tt>  <b> 2.</b> Some application(bmcweb) would do the
              Inotify on the path(/var/log/redfish) and send the event
              once there is any activity on this file.</tt></p>
          <pre>&gt; I thought we can have mapping in bmcweb for ResourceTypes with set of MessageID's for Logged events ( As 
per Intel design)

    Can you explain more here. What is your plan? How you would do the Resource Type based event filtering? <span class="pl-s">REDFISH_MESSAGE_ID is different than the resource type.</span></pre>
        </blockquote>
        Initially i thought "ResourceType" based event filtering can be
        done using minimal mapping( Using MessageID and args). But that
        will work for minimal set. If the supported ResourceTypes grows,
        we will have bigger challenges which i can sense it now. 
        Anyway, Supported Resources are completely implementation
        specific. If this value is empty means, by default all event
        logs will be sent to subscribers. This is what we can start with
        before supported  ResourceTypes list grows.<br>
        <blockquote type="cite"
          cite="mid:813853bb-b3a3-79a7-94c5-bbe487c2902b@linux.vnet.ibm.com">
          <pre><span class="pl-s"><span class="pl-pds"></span></span><span class="pl-s"></span></pre>
          <blockquote type="cite"
            cite="mid:1a22b091-675c-3e1d-b57a-d44b3ba5d4e0@linux.intel.com">
            <br>
            As per my reading from below query, You are looking at d-bus
            match rules and ResourceTypes mapping which is more specific
            to d-bus event logging(IBM way of implementing event
            logging). reading it from journal logs will give more
            information but that will impact the performance to large
            extent. This might be one of the reason why we (Intel) uses
            Redfish message ID while logging redfish events logs to
            journal(You can refer design document for same at <a
              class="moz-txt-link-freetext"
href="https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md"
              moz-do-not-send="true">https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md</a>).
            In opinion, in your d-bus if you are using some kind of
            filter(Example REDFISH_MESSAGE_ID) while logging in journal
            logs for all events and figure out the way to monitor the
            journal logs without impacting the performance, that should
            be ok as long as match filters are satisfied for Redfish
            EventService subscriptions and supported Types(Again differs
            with implementation). <br>
            <br>
            Thanks, <br>
            <br>
            -Appu <br>
            <br>
            On 2/10/2020 1:52 AM, RAJESWARAN THILLAIGOVINDAN wrote: <br>
            <blockquote type="cite">ApparaRao. <br>
              <br>
              As you have shown interest in this feature and submitted
              the design document, do you have any opinion on this? Do
              you see any merit in using D-Bus match in bmcweb to create
              event logs for life cycle events?  Please feel free to
              weigh in. <br>
              <br>
              Thanks, <br>
              Rajes <br>
              <br>
              On 01-02-2020 02:23, RAJESWARAN THILLAIGOVINDAN wrote: <br>
              <blockquote type="cite">Hi, <br>
                <br>
                I am going through the bmcweb code for implementing
                Redfish EventService based on the design document <a
                  class="moz-txt-link-freetext"
                  href="https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749"
                  moz-do-not-send="true">https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749</a>.
                This design is hooked to the journal based Redfish Event
                Logging. For life cycle events(ResourceAdded,
                ResourceRemoved, ResourceUpdated),  using D-Bus match,
                bmcweb can create an event log. This requires a JSON
                dictionary, comprising an array of Redfish Resource Name
                and the D-Bus path. This approach works only in case of
                one to one mapping of Redfish Resource Name and the
                D-Bus path. For propertiesChanged events, if the Redfish
                Resource property is not on the same D-Bus path or the
                Redfish Resource property name is different from the
                D-Bus property name, then an additional JSON dictionary
                to maintain this information is required. With D-Bus
                match alone in the bmcweb, Redfish EventService can't be
                fully supported. For the Message Registers and the
                Resource Types that are supported, the relevant OpenBMC
                application must create an event log in the journal
                using either the phosphor::logging::entry or
                sd_journal_send() command. <br>
                <br>
                After realizing that with D-Bus match in the bmcweb
                alone can't help to fully implement EventService, I
                prefer to avoid using D-Bus match in bmcweb. Instead, I
                prefer to modify the OpenBMC application that generated
                the event to create an event log in the journal. Do you
                see any advantage of using combination of D-Bus match in
                the bmcweb wherever it is possible and changes to
                OpenBMC application in other cases to create an event
                log ? <br>
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
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------8BE8112A3B131FA5F771D4DC--
