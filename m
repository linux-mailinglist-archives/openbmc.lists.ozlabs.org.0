Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3313133057
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 21:09:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sk4L62k3zDqNn
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 07:09:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sk394ZbRzDqPF
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2020 07:08:36 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jan 2020 12:08:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,407,1571727600"; d="scan'208";a="421206682"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 07 Jan 2020 12:08:33 -0800
Received: from [10.241.245.1] (unknown [10.241.245.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9251C58033E;
 Tue,  7 Jan 2020 12:08:33 -0800 (PST)
Subject: Re: Redfish Dump Service Proposal
To: openbmc@lists.ozlabs.org
References: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
 <OF3E82A637.78F050C7-ON002584CE.0025B2F4-002584CE.00271DE9@notes.na.collabserv.com>
 <CAH1kD+YfetwAmGQfjF4ytCQYhhaEorgdiA5svwjm7X91-yG1Tg@mail.gmail.com>
 <CACkAXSpCwhUwzh1uZMMkFvtkO7Tdi4xoHaq1KtaAndR8pR2gbA@mail.gmail.com>
 <ac75a152-9bdf-0029-67e8-60e4e99eb1cc@linux.intel.com>
 <CAK7WoshJ7xMhB_E-ZEpVR+1E_AuGpZfGUFToOihoC5hZ9xyGGg@mail.gmail.com>
 <CAK7WoshsUE2+GXGEgxe99vkz4aEYTdT_ZcNE_k4Y_6x7JLWsTQ@mail.gmail.com>
 <62dc3198-40d4-b0f6-4c31-cf829d9311d6@linux.intel.com>
 <bc442056-ea92-9c65-1028-50839123e5b7@linux.vnet.ibm.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <a281f9ca-9dc7-9e7a-8e87-08a313d43fe9@linux.intel.com>
Date: Tue, 7 Jan 2020 12:08:33 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bc442056-ea92-9c65-1028-50839123e5b7@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: john.leung@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 1/7/2020 2:11 AM, Ratan Gupta wrote:
> Hi All,
> 
> Thanks for the responses, Please find my comments inline.
> 
> Ratan
> 
> On 19/12/19 4:08 AM, Bills, Jason M wrote:
>>
>>
>> On 12/17/2019 7:25 PM, dhruvaraj S wrote:
>>> Hi,
>>>
>>> I have an additional comment on creating the dump, there are some
>>> dumps which can take longer than an hour on certain systems and BMC
>>> has no control over its execution. Can we have an additional interface
>>> similar to approach 2 in creating a user-initiated dump named
>>> 'Initiate Dump'? Which just initiate the dump asynchronously, without
>>> returning an ID, and such dump will get generated at a later time and
>>> a redfish resource for that dump will be created after the generation.
> Dhruvaraj,
> With approach 2(Task based approach) we would return the task ID and not 
> the dump resource ID. Hence I do not see a need to reinvent a new action.
> 
> Following is the flow in a task based approach which will also work for 
> your mentioned scenario
> => User initiates the dump
> => BMC starts the task and returns the task url to the client
> => Once the task is completed, BMC sends the redfish notification(task 
> completed) to the client
> => Client fires the GET request on the task to get the details of the task
> => Task should tell the dump resource ID of the created dump
> https://redfish.dmtf.org/schemas/Task.v1_4_2.json
> We can use TargetUri under the payload property of the task for the 
> generated dump resource URL.
> Please note, mapping of a Task Id to the Dump Id/Log entry Id is 
> internal to the implementation.
>>
>> I think this is a great example of where TaskService and Task Monitor 
>> would be used.  The response to the command to generate a dump will 
>> provide a URI to a Task Monitor that can be queried for status on the 
>> dump.
>>
>> When the dump is completed and the new dump resource has been created, 
>> the Task Monitor will return the location of the dump.
>>
>> I'm looking to start working on a Task Service design soon and will 
>> notify the mailing list before I start.
>>
> Thanks Jason, It is good to hear that you are starting the design for 
> Task Service.
>>>
>>> lPOST https://${bmc_ip}/redfish/v1/DumpService/Actions/InitiateDump
>>> dumpType=BMC/Host/<or a different type>
>>>
>>> The main difference from approach 2 in CreateDump is, no redfish
>>> resource for the dump will be created after initiating but only after
>>> the system generated the dump.
>>
>> I agree.  The new Redfish resource should only be created after the 
>> dump has completed.
> 
> Jason,
> 
> I am fine with it, I have proposed the flow above for the task based 
> approach.
> What is your view where redfish resource has been created and the state 
> of the resource tells that the resource is not in ready state or 
> downladable.
> Get Operation on the resource would be supported which will get the high 
> level detail(size,state etc) of the Dump Resource but the dump can be 
> downloaded through the download action.

Ratan,

I don't think we should create any resources until the log is completed. 
  I don't think the resource info such as size will be very useful until 
it's ready and would add complexity to support.

>>
>>>
>>> On Sat, Dec 14, 2019 at 10:57 AM dhruvaraj S <dhruvaraj@gmail.com> 
>>> wrote:
>>>>
>>>> Few comments..
>>>>
>>>> On Sat, Dec 14, 2019 at 1:32 AM Bills, Jason M
>>>> <jason.m.bills@linux.intel.com> wrote:
>>>>>
>>>>> I like this as well.  I'm trying to support a CPU crashdump that would
>>>>> fit perfectly with this proposal.
>>>>>
>>>>> A question and some comments below:
>>>>>
>>>>> Will Dump only have the two types: BMC and Host?  Could this be more
>>>>> flexible to allow for multiple different types of dumps from various
>>>>> components?
>>>> + I think dump types should be flexible to cover different types of
>>>> host or bmc dumps from different components with varying formats.
> Sure we can enhance the type of dump, it is enum in the proposal which 
> can be enhanced.
> What could be other dump type which I can add in the types?

I don't have anything specific in mind, but it's possible that there 
would be multiple different types of dumps from the Host and BMC.  For 
example, the BMC might capture a different dump for a Host PCIe error 
vs. a Host Memory error.  Or would both of those be a Host type since 
that is where the data is from?

>>>>>
>>>>> On 12/12/2019 9:46 PM, Jayanth Othayoth wrote:
>>>>>>
>>>>>> Dump is an additional debug data associated  to an error event.
>>>>>>   From the phosphor-debug-collector  perspective,  BMC Dump collects
>>>>>> additional debug information, which canot be contained in the 
>>>>>> error log.
>>>>>> Please find my comments inline.
>>>>>>
>>>>>> On Fri, Dec 13, 2019 at 6:27 AM Richard Hanley <rhanley@google.com
>>>>>> <mailto:rhanley@google.com>> wrote:
>>>>>>
>>>>>>      Hi Ratan,
>>>>>>
>>>>>>      I think this service is a really good idea.  A couple of 
>>>>>> thoughts:
>>>>>>
>>>>>>      1) I don't think the semantics around the Download action are
>>>>>>      consistent.  Generally actions are reserved for stateful 
>>>>>> changes,
>>>>>>      and only have post methods.  I think this could be simplified by
>>>>>>      putting an @odata.id <http://odata.id> in the Dump resource that
>>>>>>      points to the raw dump file.  Then clients can do a normal 
>>>>>> HTTP get
>>>>>>      on that URL.
>>>>> I agree.  Currently, I have crashdump as a LogService, so it is very
>>>>> easy to list and download the dumps using the standard
>>>>> LogService/LogEntry resources.
> Richard,
> 
> It makes sense to remove the download action from the dump resource and 
> use the odata.id which points to the raw dump file.
> Not having dump service as root and putting the dumps under logservice, 
> do we want to say some thing like below
> /redfish/v1/LogService/entries/<id>
> and now the odata.id of log entry would point to the raw dump resource 
> file if the type of the log entry is "dump".
> Now if it is correct then in that case the log entries would be pointing 
> to each other to show the association of system generated dump with an 
> error event.
> Apart from this as we may have multiple type of dumps then in that we 
> need to enhance the log entry to specify the type of dump.

Internally we have discussed proposing this type of enhancement to 
LogEntry to provide support for this service.

>>>>>
>>>>>>
>>>>>>      2) I'm wondering what is the best way to communicate what 
>>>>>> MIME type
>>>>>>      the raw dump supports.  In theory that could be a part of the
>>>>>>      RawDump resource.  However, a case could be made that it 
>>>>>> should be
>>>>>>      put into the Dump resource.
>>>>>>
>>>>>>      3) Perhaps the dump service should be embedded into other 
>>>>>> resources,
>>>>>>      instead of being a top level service.  I'm imagining 
>>>>>> something like
>>>>>>      how the LogService is setup.  That way there are a lot fewer
>>>>>>      dumpTypes for any particular instance of the service.
>>>>>>          a) This could be taken to the extreme, and the 
>>>>>> DumpService could
>>>>>>      be integrated with the existing LogServices.  This would mean 
>>>>>> adding
>>>>>>      in a new log type, and having a new action >
>>>>>>      +Agree with this suggestion to embedding dump under log 
>>>>>> service as
>>>>>>      new EventType.  Also need an association  for each system 
>>>>>> generated
>>>>>>      dump with an error event.
>>>>> Yes.  I think it would be better to integrate with the existing
>>>>> LogServices.  The existing resources already provide a lot of what is
>>>>> needed, so we can leverage that.
>>>> +Agree with integrating dump under LogService, The id of the dump 
>>>> can be
>>>> unique to dump type, so something like Dumps/<DumpType>/<id>?
>>>>>
>>>>> The idea that I'm currently using is instead of providing the dump
>>>>> content directly in the LogEntry, it provides a URI where the dump can
>>>>> be downloaded.  I was thinking of proposing to add a "Uri" property or
>>>>> EntryType to LogEntry to support this.  That would allow many 
>>>>> different
>>>>> types of dump data to be included without having to specify the 
>>>>> content
>>>>> (similar to how the MessageRegistryFile and JsonSchemaFile resources
>>>>> work today, perhaps defining a DumpFile).
>>>>>
>>>>> With support for LogService, the DumpService would really only need to
>>>>> add support for the "Create" action and all logs would be available
>>>>> under the corresponding dump LogService.
>>>>>
>>>>> For the asynchronous create, the Redfish Task Monitor seems like the
>>>>> right solution to handle the dump as a long-running task. That way the
>>>>> create command can immediately return and provide the Task Monitor to
>>>>> track completion.
>>>> +Yes, for some types of long-running dump tasks, the dump id may not be
>>>> available immediately, The  response body with the dump id can be 
>>>> returned
>>>> once the operation is completed successfully.
>>>>>
>>>>> In the meantime, I am using the LogService to track when the newly
>>>>> created entry becomes available.
>>>>>
>>>>>>
>>>>>>
>>>>>>      4) It might be a good idea to have some event support in the 
>>>>>> cases
>>>>>>      where a dump is created because of a machine crash.
>>>>> Wouldn't we also get this by leveraging the LogService?
>>>>>
>>>>>>
>>>>>>      Regards,
>>>>>>      Richard
>>>>>>
>>>>>>      On Wed, Dec 11, 2019 at 11:08 PM Devender Rao 
>>>>>> <devenrao@in.ibm.com
>>>>>>      <mailto:devenrao@in.ibm.com>> wrote:
>>>>>>
>>>>>>          Over all the schema looks good. Few observations for 
>>>>>> clarity,
>>>>>>          also how about we have multiple collection say
>>>>>>          HostDumpCollection, BMCDumpCollection  and also a new 
>>>>>> service
>>>>>>          DumpLocations similar to "CertificateLocations"
>>>>> If we use LogService, each of these collections could just be a 
>>>>> separate
>>>>> LogService.
>>>>>
>>>>>>
>>>>>>          Page 17: Dump Creation flow
>>>>>>          1. The time line diagram should show that "Request to create
>>>>>>          dump" return immediatley. The redfish client will be 
>>>>>> notififed
>>>>>>          asynchronously when the dump is collected through 
>>>>>> DumpCollected
>>>>>>          event. Request for dump with resource id should be in the 
>>>>>> same
>>>>>>          time line when it gets notified of Dump collection 
>>>>>> completed. >         Page 19: For clarity
>>>>>>          "List Dumps" should be shown as part of DumpColletion rather
>>>>>>          than under "Operations on dump"
>>>>>>          "Get Dump details" should be shown under dump service
>>>>>>          "Delete Dumps" should be shown under DumpService
>>>>>>
>>>>>>              ----- Original message -----
>>>>>>              From: Ratan Gupta <ratagupt@linux.vnet.ibm.com
>>>>>> <mailto:ratagupt@linux.vnet.ibm.com>>
>>>>>>              Sent by: "openbmc"
>>>>>> <openbmc-bounces+devenrao=in.ibm.com@lists.ozlabs.org
>>>>>> <mailto:in.ibm.com@lists.ozlabs.org>>
>>>>>>              To: "openbmc@lists.ozlabs.org
>>>>>>              <mailto:openbmc@lists.ozlabs.org>" 
>>>>>> <openbmc@lists.ozlabs.org
>>>>>>              <mailto:openbmc@lists.ozlabs.org>>
>>>>>>              Cc:
>>>>>>              Subject: [EXTERNAL] Redfish Dump Service Proposal
>>>>>>              Date: Thu, Dec 12, 2019 5:09 AM
>>>>>>              Hi All,
>>>>>>
>>>>>>              Please find the redfish dump service proposal for the 
>>>>>> DMTF
>>>>>>              attached.
>>>>>>
>>>>>>              Kindly review and provide your inputs.
>>>>>>
>>>>>>              Ratan
>>>>>>
>>>>>>
>>>>>>
>>>>
>>>>
>>>>
>>>> -- 
>>>> --------------
>>>> Dhruvaraj S
>>>
>>>
>>>
> 
