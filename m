Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B8E1C54A7
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 13:44:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GdD96lSGzDqdl
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 21:44:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com;
 envelope-from=rajeswaran.thillaigovindan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DoIfqrEY; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GdC76NtpzDqdT
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 21:43:10 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id r14so779592pfg.2
 for <openbmc@lists.ozlabs.org>; Tue, 05 May 2020 04:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language;
 bh=lwVEoX6MrEAAmMBJs76lNItKAqwGzmcEN+3nPs6PjuQ=;
 b=DoIfqrEYVgvRt7dG4hgrHxyeZAeRv6eJTZs5Qz/BhRWCAPYtkljYmjuHVPbBfLLPVK
 CFlFXaNLn/hQsWHm/kd/RLqa6hH9jxUwTPShThS5Q8FK7Qk5MDge9+os4HIIhxKgEJyL
 1VrSHhhpzNLgzveIAjiLtTCBqbAeIcVdOfCIN2qkYIm9T3ciKmV8lSRDfFNQArGbWNn8
 SW2FbvSwlyQ2MnhGCCOmcMaz706wDpqAbiQ0f5ZP4AB8tiXvhLyePm7oyB5AMODbVp+v
 HshK8IO1hfzntdMu17A1diL/yelgwPYX7iFeXljDCb/wKty9gpLRQ8mX7Sah+dpjVYyE
 uUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=lwVEoX6MrEAAmMBJs76lNItKAqwGzmcEN+3nPs6PjuQ=;
 b=mptmAmTCpfzUxwofKN26aL3lXzXzBKoNBjtWNuWHd4cc49g6swJsZJC1xENEc8qthv
 qKkNjtUyucl+1uEviAcA9wMexpx35SIhv8mfwttM5HuH/AfsEuLevWs6BwLcAUTPnEb4
 jqNL6SM20DSVPRBi1dHzqpYTdUW4kbF5d1TuKdi0UjfXPpfGlwMYpE6Kly7aqSgoMhT0
 PDFQrp4jDrhjoXQ0Y2xdvGKP3CRiCTu8L8Lget9GtDS5+gEsylHSczYADV7dXe9pfFI6
 Qn3KNNx0jaTwo43pDYXv7lZGOnyvd5YDde4rz5ydkrOs90LLb5RPT9t1iyRjnid35niQ
 5GvA==
X-Gm-Message-State: AGi0PuZTzzvSBElYBWt/eZ0/SuKXIUIo+qw73cZOzZ9S/uXE6yI6YWrV
 eMCht5toQlPf8dmAn3OzLPUEcQ4F
X-Google-Smtp-Source: APiQypKQvGAXZINT9eB66DtYgkjuiSlMwlz30+0oGW5eb1IVJzVqDrgW6IGtUk6XFUlHIG/BP2docA==
X-Received: by 2002:a63:41c2:: with SMTP id o185mr2546543pga.139.1588678986019; 
 Tue, 05 May 2020 04:43:06 -0700 (PDT)
Received: from [192.168.1.4] ([122.178.201.102])
 by smtp.gmail.com with ESMTPSA id 188sm1556943pfg.218.2020.05.05.04.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2020 04:43:05 -0700 (PDT)
Subject: Re: Redfish EventService Implementation
To: "Puli, Apparao" <apparao.puli@linux.intel.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <7a3d4141-ff5f-794a-6803-88a8bcfa3e02@gmail.com>
 <1a22b091-675c-3e1d-b57a-d44b3ba5d4e0@linux.intel.com>
 <813853bb-b3a3-79a7-94c5-bbe487c2902b@linux.vnet.ibm.com>
 <d27f94a5-7195-422a-9442-9e5e3e0aaae7@linux.intel.com>
From: RAJESWARAN THILLAIGOVINDAN <rajeswaran.thillaigovindan@gmail.com>
Message-ID: <83457df9-b381-4193-bc32-4babe73fc1e1@gmail.com>
Date: Tue, 5 May 2020 17:13:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <d27f94a5-7195-422a-9442-9e5e3e0aaae7@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="------------6CA1CCEE1D539F57138FC5BD"
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
--------------6CA1CCEE1D539F57138FC5BD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Further to my previous mail, I wanted to see how a JSON dictionary would 
look like for implementing Redfish EventService based on D-Bus match. 
The D-Bus match approach is good for implementing life cycle 
events((ResourceAdded, ResourceRemoved, ResourceUpdated). In bmcweb, a 
Redfish Resource is viewed as having a set of properties which comes 
from one or more D-Bus objects. So, when a client subscribes for a 
ResourceType, using a JSON dictionary, find the D-Bus object(s) mapped 
to the ResourceType and create matches. When the D-Bus match occurs, 
again using aJSON dictionary, find the Redfish ResourceType mapped to 
the D-Bus object and create events. The JSON dictionary should also 
provide the Redifsh URI which needs to be specified in the event. An 
example JSON dictionary for mapping the Redifsh ResourceTypes LogEntry 
and ComputerSystem is available here : 
https://gist.github.com/trajeswaran/fec230abd36181f85d2f20d09164ec05. In 
case of LogEntry, there is one to one mapping of ResourceType to D-Bus 
object. In case of ComputerSystem, the properties comes from multiple 
D-Bus objects. Do you see any drawback with this approach?  Kindly let 
me know what you think. Thanks in advance.


On 25-02-2020 19:36, Puli, Apparao wrote:
>
> Hi Ratan,
>
>    Comments in-line
>
> On 2/24/2020 12:07 PM, Ratan Gupta wrote:
>>
>> Hi Apparao,
>>
>> On 2/20/20 12:49 AM, Puli, Apparao wrote:
>>> Hi,
>>>
>>>   I am sorry for late response as this mail is buried under and got 
>>> struck back of my mind.
>>>
>>> As i did mentioned in EventService design document, EventLog Monitor 
>>> service is not common across the organizations( Example: Intel uses 
>>> the redfish event logs file and inotify mechanism for monitoring the 
>>> event logs. Where as IBM uses d-bus event log mechanism and they can 
>>> relay on match rules). That said challenges with ResourceType 
>>> mapping will be different in both monitoring mechanisms. This is 
>>> good point. Initially when i started EventService design, i thought 
>>> we can have mapping in bmcweb for ResourceTypes with set of 
>>> MessageID's for Logged events ( As per Intel design) but not sure 
>>> that may become difficult when we expand supported ResourceTypes.
>>
>> If I am getting correctly, Here is the flow which Intel uses.
>>
>>  1. Individual repo have to push the logs using sd_journal_send which
>>     will write to the file(/var/log/redfish) by using rsyslog daemon
>>
>> sd_journal_send("MESSAGE=%s","journal text","PRIORITY=%i", <LOG_LEVEL>,
>>                  "REDFISH_MESSAGE_ID=%s",
>>                  "ResourceEvent.1.0.ResourceCreated",NULL);
>>
>>       * How you would populate the "OriginOfCondition" during sending
>>         of event? (https://redfish.dmtf.org/schemas/v1/Event.v1_4_1.json)
>>
> Currently in logServices( logEntry),  we are not reporting the 
> "OriginOfCondition" property as per schema. I will check with Jason( 
> Who wrote the logService) and get back on this.
>
> BTW can you give me how this information is fetched in IBM way of 
> LogService implementation( D-Bus)? If you already ratified any such, i 
> think we can leverage.  If not, We work together for solution.
>
>>       * Any plan to add resource path in this journal message which
>>         tells that this is the path for which resource created event
>>         generated.
>>
> Same as above.
>>
>>       * Would the path be "Redfish Path/ D-bus Path"?
>>
> As per Redfish specification, This should be "@odata.id" which means 
> it should be of resource uri and so we can't use d-bus path here for 
> OriginOfConditions.
>>
>>       * Where the mapping would be done between D-busPath/Redfish
>>         Resource path?
>>
>>      
>>           Cons: Every application have to make the change(use sd_journal_send).
>>           My thought is backend application should not be aware of the redfish terminlogy.
>
> Having separate process only for this mapping may not be good( No 
> different from maintaining that map inside bmcweb as there won't be 
> any other consumers). Ideal way is, that should be mapped while 
> logging logEntry's itself. But we are not doing it currently which 
> need to be re-looked. Give me some time, I will think and check with 
> other folks and get back.
>
>> *2.* Some application(bmcweb) would do the Inotify on the 
>> path(/var/log/redfish) and send the event once there is any activity 
>> on this file.
>>
>> > I thought we can have mapping in bmcweb for ResourceTypes with set of MessageID's for Logged events ( As 
>> per Intel design)
>>
>>      Can you explain more here. What is your plan? How you would do the Resource Type based event filtering?REDFISH_MESSAGE_ID is different than the resource type.
> Initially i thought "ResourceType" based event filtering can be done 
> using minimal mapping( Using MessageID and args). But that will work 
> for minimal set. If the supported ResourceTypes grows, we will have 
> bigger challenges which i can sense it now.  Anyway, Supported 
> Resources are completely implementation specific. If this value is 
> empty means, by default all event logs will be sent to subscribers. 
> This is what we can start with before supported ResourceTypes list grows.
>>>
>>> As per my reading from below query, You are looking at d-bus match 
>>> rules and ResourceTypes mapping which is more specific to d-bus 
>>> event logging(IBM way of implementing event logging). reading it 
>>> from journal logs will give more information but that will impact 
>>> the performance to large extent. This might be one of the reason why 
>>> we (Intel) uses Redfish message ID while logging redfish events logs 
>>> to journal(You can refer design document for same at 
>>> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md). 
>>> In opinion, in your d-bus if you are using some kind of 
>>> filter(Example REDFISH_MESSAGE_ID) while logging in journal logs for 
>>> all events and figure out the way to monitor the journal logs 
>>> without impacting the performance, that should be ok as long as 
>>> match filters are satisfied for Redfish EventService subscriptions 
>>> and supported Types(Again differs with implementation).
>>>
>>> Thanks,
>>>
>>> -Appu
>>>
>>> On 2/10/2020 1:52 AM, RAJESWARAN THILLAIGOVINDAN wrote:
>>>> ApparaRao.
>>>>
>>>> As you have shown interest in this feature and submitted the design 
>>>> document, do you have any opinion on this? Do you see any merit in 
>>>> using D-Bus match in bmcweb to create event logs for life cycle 
>>>> events?  Please feel free to weigh in.
>>>>
>>>> Thanks,
>>>> Rajes
>>>>
>>>> On 01-02-2020 02:23, RAJESWARAN THILLAIGOVINDAN wrote:
>>>>> Hi,
>>>>>
>>>>> I am going through the bmcweb code for implementing Redfish 
>>>>> EventService based on the design document 
>>>>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749. This 
>>>>> design is hooked to the journal based Redfish Event Logging. For 
>>>>> life cycle events(ResourceAdded, ResourceRemoved, 
>>>>> ResourceUpdated),  using D-Bus match, bmcweb can create an event 
>>>>> log. This requires a JSON dictionary, comprising an array of 
>>>>> Redfish Resource Name and the D-Bus path. This approach works only 
>>>>> in case of one to one mapping of Redfish Resource Name and the 
>>>>> D-Bus path. For propertiesChanged events, if the Redfish Resource 
>>>>> property is not on the same D-Bus path or the Redfish Resource 
>>>>> property name is different from the D-Bus property name, then an 
>>>>> additional JSON dictionary to maintain this information is 
>>>>> required. With D-Bus match alone in the bmcweb, Redfish 
>>>>> EventService can't be fully supported. For the Message Registers 
>>>>> and the Resource Types that are supported, the relevant OpenBMC 
>>>>> application must create an event log in the journal using either 
>>>>> the phosphor::logging::entry or sd_journal_send() command.
>>>>>
>>>>> After realizing that with D-Bus match in the bmcweb alone can't 
>>>>> help to fully implement EventService, I prefer to avoid using 
>>>>> D-Bus match in bmcweb. Instead, I prefer to modify the OpenBMC 
>>>>> application that generated the event to create an event log in the 
>>>>> journal. Do you see any advantage of using combination of D-Bus 
>>>>> match in the bmcweb wherever it is possible and changes to OpenBMC 
>>>>> application in other cases to create an event log ?
>>>>>
>>>>> Your views are highly appreciated.
>>>>>
>>>>> Thanks,
>>>>> Rajes
>>>>
>> Thanks
>> Ratan
>>
>>

--------------6CA1CCEE1D539F57138FC5BD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <p>Further to my previous mail, I wanted to see how a JSON
      dictionary would look like for implementing Redfish EventService
      based on D-Bus match. The D-Bus match approach is good for
      implementing life cycle events((ResourceAdded, ResourceRemoved,
      ResourceUpdated). In bmcweb, a Redfish Resource is viewed as
      having a set of properties which comes from one or more D-Bus
      objects. So, when a client subscribes for a ResourceType, using a
      JSON dictionary, find the D-Bus object(s) mapped to the
      ResourceType and create matches. When the D-Bus match occurs,
      again using aJSON dictionary, find the Redfish ResourceType mapped
      to the D-Bus object and create events. The JSON dictionary should
      also provide the Redifsh URI which needs to be specified in the
      event. An example JSON dictionary for mapping the Redifsh
      ResourceTypes LogEntry and ComputerSystem is available here : <a
        moz-do-not-send="true"
href="https://gist.github.com/trajeswaran/fec230abd36181f85d2f20d09164ec05">
https://gist.github.com/trajeswaran/fec230abd36181f85d2f20d09164ec05</a>.
      In case of LogEntry, there is one to one mapping of ResourceType
      to D-Bus object. In case of ComputerSystem, the properties comes
      from multiple D-Bus objects. Do you see any drawback with this
      approach?  Kindly let me know what you think. Thanks in advance. <br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 25-02-2020 19:36, Puli, Apparao
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d27f94a5-7195-422a-9442-9e5e3e0aaae7@linux.intel.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <div class="moz-cite-prefix">On 2/20/20 12:49 AM, Puli, Apparao
          wrote:<br>
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
          d-bus event log mechanism and they can relay on match rules).
          That said challenges with ResourceType mapping will be
          different in both monitoring mechanisms. This is good point.
          Initially when i started EventService design, i thought we can
          have mapping in bmcweb for ResourceTypes with set of
          MessageID's for Logged events ( As per Intel design) but not
          sure that may become difficult when we expand supported
          ResourceTypes. <br>
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
      <p><tt>Currently in logServices( logEntry),  we are not reporting
          the "OriginOfCondition" property as per schema. I will check
          with Jason( Who wrote the logService) and get back on this.</tt></p>
      <p><tt>BTW can you give me how this information is fetched in IBM
          way of LogService implementation( D-Bus)? If you already
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
      means it should be of resource uri and so we can't use d-bus path
      here for OriginOfConditions.<br>
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
      <p>Having separate process only for this mapping may not be good(
        No different from maintaining that map inside bmcweb as there
        won't be any other consumers). Ideal way is, that should be
        mapped while logging logEntry's itself. But we are not doing it
        currently which need to be re-looked. Give me some time, I will
        think and check with other folks and get back.<br>
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
      we will have bigger challenges which i can sense it now.  Anyway,
      Supported Resources are completely implementation specific. If
      this value is empty means, by default all event logs will be sent
      to subscribers. This is what we can start with before supported 
      ResourceTypes list grows.<br>
      <blockquote type="cite"
        cite="mid:813853bb-b3a3-79a7-94c5-bbe487c2902b@linux.vnet.ibm.com">
        <pre><span class="pl-s"><span class="pl-pds"></span></span><span class="pl-s"></span></pre>
        <blockquote type="cite"
          cite="mid:1a22b091-675c-3e1d-b57a-d44b3ba5d4e0@linux.intel.com">
          <br>
          As per my reading from below query, You are looking at d-bus
          match rules and ResourceTypes mapping which is more specific
          to d-bus event logging(IBM way of implementing event logging).
          reading it from journal logs will give more information but
          that will impact the performance to large extent. This might
          be one of the reason why we (Intel) uses Redfish message ID
          while logging redfish events logs to journal(You can refer
          design document for same at <a class="moz-txt-link-freetext"
href="https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md"
            moz-do-not-send="true">https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md</a>).
          In opinion, in your d-bus if you are using some kind of
          filter(Example REDFISH_MESSAGE_ID) while logging in journal
          logs for all events and figure out the way to monitor the
          journal logs without impacting the performance, that should be
          ok as long as match filters are satisfied for Redfish
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
            As you have shown interest in this feature and submitted the
            design document, do you have any opinion on this? Do you see
            any merit in using D-Bus match in bmcweb to create event
            logs for life cycle events?  Please feel free to weigh in. <br>
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
              one to one mapping of Redfish Resource Name and the D-Bus
              path. For propertiesChanged events, if the Redfish
              Resource property is not on the same D-Bus path or the
              Redfish Resource property name is different from the D-Bus
              property name, then an additional JSON dictionary to
              maintain this information is required. With D-Bus match
              alone in the bmcweb, Redfish EventService can't be fully
              supported. For the Message Registers and the Resource
              Types that are supported, the relevant OpenBMC application
              must create an event log in the journal using either the
              phosphor::logging::entry or sd_journal_send() command. <br>
              <br>
              After realizing that with D-Bus match in the bmcweb alone
              can't help to fully implement EventService, I prefer to
              avoid using D-Bus match in bmcweb. Instead, I prefer to
              modify the OpenBMC application that generated the event to
              create an event log in the journal. Do you see any
              advantage of using combination of D-Bus match in the
              bmcweb wherever it is possible and changes to OpenBMC
              application in other cases to create an event log ? <br>
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
  </body>
</html>

--------------6CA1CCEE1D539F57138FC5BD--
