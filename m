Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3796B204B00
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 09:28:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rdDC43fTzDqQm
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 17:28:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rdCM6kqXzDqQK
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 17:27:27 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05N78ik8067000; Tue, 23 Jun 2020 03:27:21 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ud378j7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 03:27:20 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05N7KcUO026850;
 Tue, 23 Jun 2020 07:27:18 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 31sa37vnx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 07:27:18 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05N7RGof62849504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jun 2020 07:27:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAB5FA4060;
 Tue, 23 Jun 2020 07:27:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4F1DA405C;
 Tue, 23 Jun 2020 07:27:13 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.86.127])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Jun 2020 07:27:13 +0000 (GMT)
Subject: Re: Redfish EventService Implementation
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
 <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
 <1d2ad757-826d-1993-b88a-e92010b984ed@linux.vnet.ibm.com>
 <05ec7793-2efa-42da-ef56-94cc1477d2bb@linux.intel.com>
 <20200616152428.GA4618@heinlein>
 <7e16df1c-38b0-d488-dbbf-75fe9ac818ab@linux.intel.com>
 <68f31493-6db6-8e8e-8486-e03c14685abe@linux.vnet.ibm.com>
 <20200617204516.GE4618@heinlein>
 <fde794a3-58f9-f332-fd3b-3cfcc116f239@linux.vnet.ibm.com>
Message-ID: <20ab2d6a-00d8-edc6-a18a-c98d93c6cb3c@linux.vnet.ibm.com>
Date: Tue, 23 Jun 2020 12:57:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <fde794a3-58f9-f332-fd3b-3cfcc116f239@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------7343A92DBCADD3448D4A20CF"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-23_04:2020-06-22,
 2020-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0
 cotscore=-2147483648 mlxlogscore=999 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006230055
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>, "Puli,
 Apparao" <apparao.puli@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------7343A92DBCADD3448D4A20CF
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 6/19/20 6:56 PM, Ratan Gupta wrote:
>
>
> On 6/18/20 2:15 AM, Patrick Williams wrote:
>> On Wed, Jun 17, 2020 at 05:38:47PM +0530, Ratan Gupta wrote:
>>> Hi James,Pattrick.
>>>
>>>>> Can't we do this already today by defining a simple errors/metadata file
>>>>> in phosphor-dbus-interfaces and calling 'logging::report<...>' on it?
>>>>> This will create a record on dbus in phosphor-logging.
>>>>>
>>>> I think the original concern was with supporting on the order of
>>>> 10,000 log entries, having this on d-bus seemed impractical. Also the
>>>> free log rotation the journal provides is useful. Now modifying the
>>>> logging::report<...> to conditionally log to the journal seems realistic.
>>> My intention was not to re-implement the logging, my intention was to
>>> extend/use the existing design which we already have it below.
>>>
>>> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md
>>>
>>> I was trying not to bring the Redfish specific stuff in each individual
>>> repo, instead each transport can listen for
>>> Dbus events and write to the journal which goes to their app specific file.
>> Good.  This wasn't clear from the earlier email.  Thanks.
>>
>>
>>> As we are in agreement that we want to use the journal for persistence
>>> and log rotate feature.
>> I'm not convinced there is agreement on this.  There has been
>> disagreement about even using the journal for phosphor-logging use since
>> the beginning and I suspect there would be less agreement on another
>> application using it as its own IPC mechanism.
>>
>> Just because a hammer can be used to insert a nail into a board doesn't
>> mean you use it insert any pointy thing into a flat thing.  [ Just
>> because the journal provides log rotation and persistance doesn't mean
>> you should use it for every feature needing log rotation and
>> persistance. ]
>>
>>
>>> ***** As per the Redfish one of the requirement is we need the log for
>>> most of the Dbus Property update/interface added as they
>>> are mapped to some Redfish Resource and the bmcweb has to send the
>>> Resource updated/modified signal to the
>>> Redfish client. ******
>
> Jaosn: You asked the following query in other thread /*"Why do we want 
> to log on D-Bus property updates?  This seems like it will be too 
> noisy for the EventLog*"/
>
> Eg: Client is interested for an event when ever there is any user 
> add/delete or network configuration change or there is a log entry 
> resource gets created,To handle this request the flow would be
>
> Redfish Client subscribe for "ResourceType" eg: 
> "EthernetService,AccountService,LogService"  with subordinate 
> resources property as truewhich means the Client is looking for 
> updates on the subscribed resources and the subordinates resource, 
> These redfish resources(EthernetInterface, IP address, ManagerAccount, 
> AccountService) would be mapped to some D-bus Resources, hence some 
> application/bmcweb  would monitor the Dbus signals on the interested 
> Dbus objects and send the Redfish event to the subscribed client.
>
> Apparo: Please correct me if I am missing something.
>
>> I don't know Redfish well, so bear with me if there is something obvious
>> I'm missing.  But, the first part of this "requirement" doesn't seem to
>> follow from the second part of the "requirement" to me.
>>
>> Sending a signal of a property changing to the Redfish clients is
>> straight-forwawrd; Redfish should subscribe to all the appropriate
>> dbus-events.  I don't understand how this implies any sort of logging.
>> Where does the logging part of this requirement come from?
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749/16/designs/redfish-eventservice.md#474
>
> While I am reading the redfish 
> spec(https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.11.0.pdf) 
> , it is not clear that the events need to be persisted.I will ask in 
> the DMTF for the persistence of the events.
I have got an update from the DMTF that persistence is not required to 
be implemented for the 
events(https://redfish.dmtf.org/schemas/v1/Event.v1_5_0.json),
which implies we don't need to log the events in Journal.

More info(https://github.com/DMTF/Redfish/issues/3646)

Now updating the proposal where redfish client subscribed for Resource 
Type based events
1) Client would subscribe for the Redfish Resource(eg:ManagerAccount) to 
receive events like Account add/delete/modify
      Hence need for mapping from (RedfishResource to Dbus Resource)

2) Have the mapping info from Redfish resources to DBUS Resources (Some 
JSon file may have this mapping)

2) Have the reverse mapping from DBUS Resources to Redfish Resources
      * This is needed to send the Redfish event if there is any changes 
in the corresponding D-bus resources.
        eg BMC state change/network change etc.

3) bmcweb would monitor the DBUS events

4) Get the Redfish Path from the Mapping(2) and send the Redfish event

5) Bmcweb would buffer N number of events that can be configurable by 
redfish client. Buffer would get cleaned up in case of bmcweb restart or 
BMC reset.

James, Apparao: Please let me know if there is any more concern with 
this approach.
>
>>> We have two options:
>>>       1) Each transport interface listens for the Dbus signals and write
>>> it to their app specific file.
>>>       2) Each openbmc repo must use log::report for each D-bus property
>>> update/ interface added.
>> #2 is absolutely unworkable on the surface to me.  log::report is to
>> create a error entry (xyz.openbmc_project.Logging.Entry), which creates
>> a dbus-object, which would cause log::report to be called, which creates
>> a dbus-object, which ...
>>
>> Even if what you meant was something like logging::log<info>, this seems
>> pretty heavy.  I'm not sure this is something that can be inserted into
>> sdbusplus, especially for the ASIO-based object servers, because in many
>> cases applications register their own callback.  For the sdbus++
>> generated server bindings we could squeeze it in.  But, what you're
>> proposing here is essentially a "journal-as-dbus-monitor".  We'd
>> certainly need to make some measurements on how many kB/s worth of
>> journal entries this would create because I suspect we could end up
>> burning out a NAND flash with as many writes as that would induce.
> I would respond on the same once my query gets answered from DMTF.
> If my query gets answered yes then we have to write on flash but let's
> wait for it,

--------------7343A92DBCADD3448D4A20CF
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <div class="moz-cite-prefix">On 6/19/20 6:56 PM, Ratan Gupta wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:fde794a3-58f9-f332-fd3b-3cfcc116f239@linux.vnet.ibm.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 6/18/20 2:15 AM, Patrick Williams
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20200617204516.GE4618@heinlein">
        <pre class="moz-quote-pre" wrap="">On Wed, Jun 17, 2020 at 05:38:47PM +0530, Ratan Gupta wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi James,Pattrick.

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Can't we do this already today by defining a simple errors/metadata file
in phosphor-dbus-interfaces and calling 'logging::report&lt;...&gt;' on it?
This will create a record on dbus in phosphor-logging.

</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I think the original concern was with supporting on the order of 
10,000 log entries, having this on d-bus seemed impractical. Also the 
free log rotation the journal provides is useful. Now modifying the 
logging::report&lt;...&gt; to conditionally log to the journal seems realistic.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">My intention was not to re-implement the logging, my intention was to 
extend/use the existing design which we already have it below.

<a class="moz-txt-link-freetext" href="https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md" moz-do-not-send="true">https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md</a>

I was trying not to bring the Redfish specific stuff in each individual 
repo, instead each transport can listen for
Dbus events and write to the journal which goes to their app specific file.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Good.  This wasn't clear from the earlier email.  Thanks.


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">As we are in agreement that we want to use the journal for persistence 
and log rotate feature.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I'm not convinced there is agreement on this.  There has been
disagreement about even using the journal for phosphor-logging use since
the beginning and I suspect there would be less agreement on another
application using it as its own IPC mechanism.

Just because a hammer can be used to insert a nail into a board doesn't
mean you use it insert any pointy thing into a flat thing.  [ Just
because the journal provides log rotation and persistance doesn't mean
you should use it for every feature needing log rotation and
persistance. ]


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">***** As per the Redfish one of the requirement is we need the log for 
most of the Dbus Property update/interface added as they
are mapped to some Redfish Resource and the bmcweb has to send the 
Resource updated/modified signal to the
Redfish client. ******
</pre>
        </blockquote>
      </blockquote>
      <p><tt>Jaosn: You asked the following query in other thread </tt><tt><i><b>"Why
              do we want to log on D-Bus property updates?  This seems
              like it will be too noisy for the EventLog</b>"</i></tt></p>
      <p><tt>Eg: Client is interested for an event when ever there is
          any user add/delete or network configuration change or there
          is a log entry resource gets created,</tt><tt> To handle this
          request the flow would be</tt><br>
      </p>
      <p><tt>Redfish Client subscribe for "ResourceType" eg: 
          "EthernetService,AccountService,LogService"  with subordinate
          resources property as true</tt><tt> </tt><tt>which means the
          Client is looking for updates on the subscribed resources and
          the subordinates resource, These redfish
          resources(EthernetInterface, IP address, ManagerAccount,
          AccountService) would be mapped to some D-bus Resources, hence
          some application/bmcweb  would monitor the Dbus signals on the
          interested Dbus objects and send the Redfish event to the
          subscribed client.</tt></p>
      <p><tt>Apparo: Please correct me if I am missing something.</tt></p>
      <blockquote type="cite" cite="mid:20200617204516.GE4618@heinlein">
        <pre class="moz-quote-pre" wrap="">I don't know Redfish well, so bear with me if there is something obvious
I'm missing.  But, the first part of this "requirement" doesn't seem to
follow from the second part of the "requirement" to me.

Sending a signal of a property changing to the Redfish clients is
straight-forwawrd; Redfish should subscribe to all the appropriate
dbus-events.  I don't understand how this implies any sort of logging.
Where does the logging part of this requirement come from?</pre>
      </blockquote>
      <tt><a class="moz-txt-link-freetext"
href="https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749/16/designs/redfish-eventservice.md#474"
          moz-do-not-send="true">https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749/16/designs/redfish-eventservice.md#474</a></tt><tt><br>
      </tt><tt><br>
      </tt><tt>While I am reading the redfish
        spec(<a class="moz-txt-link-freetext"
href="https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.11.0.pdf"
          moz-do-not-send="true">https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.11.0.pdf</a>)
        , it is not clear that the events need to be persisted.</tt><tt>I
        will ask in the DMTF for the persistence of the events.</tt><tt><br>
      </tt></blockquote>
    <tt>I have got an update from the DMTF that persistence is not
      required to be implemented for the
      events(<a class="moz-txt-link-freetext" href="https://redfish.dmtf.org/schemas/v1/Event.v1_5_0.json">https://redfish.dmtf.org/schemas/v1/Event.v1_5_0.json</a>), <br>
      which implies we don't need to log the events in Journal.<br>
      <br>
      More info(<a class="moz-txt-link-freetext" href="https://github.com/DMTF/Redfish/issues/3646">https://github.com/DMTF/Redfish/issues/3646</a>)<br>
      <br>
      Now updating the proposal where redfish client subscribed for
      Resource Type based events<br>
      1) Client would subscribe for the Redfish
      Resource(eg:ManagerAccount) to receive events like Account
      add/delete/modify <br>
           Hence need for mapping from (RedfishResource to Dbus
      Resource)   <br>
      <br>
      2) Have the mapping info from Redfish resources to DBUS Resources
      (Some JSon file may have this mapping)<br>
          <br>
      2) Have the reverse mapping from DBUS Resources to Redfish
      Resources<br>
           * This is needed to send the Redfish event if there is any
      changes in the corresponding D-bus resources. <br>
             eg BMC state change/network change etc.<br>
      <br>
      3) bmcweb would monitor the DBUS events<br>
      <br>
      4) Get the Redfish Path from the Mapping(2) and send the Redfish
      event<br>
      <br>
      5) Bmcweb would buffer N number of events that can be configurable
      by redfish client. Buffer would get cleaned up in case of bmcweb
      restart or BMC reset.<br>
      <br>
      James, Apparao: Please let me know if there is any more concern
      with this approach.</tt><br>
    <blockquote type="cite"
      cite="mid:fde794a3-58f9-f332-fd3b-3cfcc116f239@linux.vnet.ibm.com"><tt>
      </tt><br>
      <blockquote type="cite" cite="mid:20200617204516.GE4618@heinlein">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">We have two options:
     1) Each transport interface listens for the Dbus signals and write 
it to their app specific file.
     2) Each openbmc repo must use log::report for each D-bus property 
update/ interface added.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">#2 is absolutely unworkable on the surface to me.  log::report is to
create a error entry (xyz.openbmc_project.Logging.Entry), which creates
a dbus-object, which would cause log::report to be called, which creates
a dbus-object, which ...

Even if what you meant was something like logging::log&lt;info&gt;, this seems
pretty heavy.  I'm not sure this is something that can be inserted into
sdbusplus, especially for the ASIO-based object servers, because in many
cases applications register their own callback.  For the sdbus++
generated server bindings we could squeeze it in.  But, what you're
proposing here is essentially a "journal-as-dbus-monitor".  We'd
certainly need to make some measurements on how many kB/s worth of
journal entries this would create because I suspect we could end up
burning out a NAND flash with as many writes as that would induce.</pre>
      </blockquote>
      <tt>I would respond on the same once my query gets answered from
        DMTF.</tt><br>
      <tt>If my query gets answered yes then we have to write on flash
        but let's </tt><br>
      <tt>wait for it,</tt><br>
      <blockquote type="cite" cite="mid:20200617204516.GE4618@heinlein">
      </blockquote>
    </blockquote>
  </body>
</html>

--------------7343A92DBCADD3448D4A20CF--

