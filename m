Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C222311EB73
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 21:02:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZM5M2XK1zDrJV
	for <lists+openbmc@lfdr.de>; Sat, 14 Dec 2019 07:02:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZM4L4N7JzDrHb
 for <openbmc@lists.ozlabs.org>; Sat, 14 Dec 2019 07:01:20 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 12:01:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,311,1571727600"; d="scan'208";a="415744008"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 13 Dec 2019 12:01:16 -0800
Received: from [10.241.245.107] (unknown [10.241.245.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id ADC95580459
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 12:01:16 -0800 (PST)
Subject: Re: Redfish Dump Service Proposal
To: openbmc@lists.ozlabs.org
References: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
 <OF3E82A637.78F050C7-ON002584CE.0025B2F4-002584CE.00271DE9@notes.na.collabserv.com>
 <CAH1kD+YfetwAmGQfjF4ytCQYhhaEorgdiA5svwjm7X91-yG1Tg@mail.gmail.com>
 <CACkAXSpCwhUwzh1uZMMkFvtkO7Tdi4xoHaq1KtaAndR8pR2gbA@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <ac75a152-9bdf-0029-67e8-60e4e99eb1cc@linux.intel.com>
Date: Fri, 13 Dec 2019 12:01:16 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACkAXSpCwhUwzh1uZMMkFvtkO7Tdi4xoHaq1KtaAndR8pR2gbA@mail.gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I like this as well.  I'm trying to support a CPU crashdump that would 
fit perfectly with this proposal.

A question and some comments below:

Will Dump only have the two types: BMC and Host?  Could this be more 
flexible to allow for multiple different types of dumps from various 
components?

On 12/12/2019 9:46 PM, Jayanth Othayoth wrote:
> 
> Dump is an additional debug data associated  to an error event.
>  From the phosphor-debug-collector  perspective,  BMC Dump collects 
> additional debug information, which canot be contained in the error log. 
> Please find my comments inline.
> 
> On Fri, Dec 13, 2019 at 6:27 AM Richard Hanley <rhanley@google.com 
> <mailto:rhanley@google.com>> wrote:
> 
>     Hi Ratan,
> 
>     I think this service is a really good idea.  A couple of thoughts:
> 
>     1) I don't think the semantics around the Download action are
>     consistent.  Generally actions are reserved for stateful changes,
>     and only have post methods.  I think this could be simplified by
>     putting an @odata.id <http://odata.id> in the Dump resource that
>     points to the raw dump file.  Then clients can do a normal HTTP get
>     on that URL.
I agree.  Currently, I have crashdump as a LogService, so it is very 
easy to list and download the dumps using the standard 
LogService/LogEntry resources.

> 
>     2) I'm wondering what is the best way to communicate what MIME type
>     the raw dump supports.  In theory that could be a part of the
>     RawDump resource.  However, a case could be made that it should be
>     put into the Dump resource.
> 
>     3) Perhaps the dump service should be embedded into other resources,
>     instead of being a top level service.  I'm imagining something like
>     how the LogService is setup.  That way there are a lot fewer
>     dumpTypes for any particular instance of the service.
>         a) This could be taken to the extreme, and the DumpService could
>     be integrated with the existing LogServices.  This would mean adding
>     in a new log type, and having a new action >
>     +Agree with this suggestion to embedding dump under log service as
>     new EventType.  Also need an association  for each system generated
>     dump with an error event.
Yes.  I think it would be better to integrate with the existing 
LogServices.  The existing resources already provide a lot of what is 
needed, so we can leverage that.

The idea that I'm currently using is instead of providing the dump 
content directly in the LogEntry, it provides a URI where the dump can 
be downloaded.  I was thinking of proposing to add a "Uri" property or 
EntryType to LogEntry to support this.  That would allow many different 
types of dump data to be included without having to specify the content 
(similar to how the MessageRegistryFile and JsonSchemaFile resources 
work today, perhaps defining a DumpFile).

With support for LogService, the DumpService would really only need to 
add support for the "Create" action and all logs would be available 
under the corresponding dump LogService.

For the asynchronous create, the Redfish Task Monitor seems like the 
right solution to handle the dump as a long-running task.  That way the 
create command can immediately return and provide the Task Monitor to 
track completion.

In the meantime, I am using the LogService to track when the newly 
created entry becomes available.

> 
> 
>     4) It might be a good idea to have some event support in the cases
>     where a dump is created because of a machine crash.
Wouldn't we also get this by leveraging the LogService?

> 
>     Regards,
>     Richard
> 
>     On Wed, Dec 11, 2019 at 11:08 PM Devender Rao <devenrao@in.ibm.com
>     <mailto:devenrao@in.ibm.com>> wrote:
> 
>         Over all the schema looks good. Few observations for clarity,
>         also how about we have multiple collection say
>         HostDumpCollection, BMCDumpCollection  and also a new service
>         DumpLocations similar to "CertificateLocations"
If we use LogService, each of these collections could just be a separate 
LogService.

> 
>         Page 17: Dump Creation flow
>         1. The time line diagram should show that "Request to create
>         dump" return immediatley. The redfish client will be notififed
>         asynchronously when the dump is collected through DumpCollected
>         event. Request for dump with resource id should be in the same
>         time line when it gets notified of Dump collection completed. >         Page 19: For clarity
>         "List Dumps" should be shown as part of DumpColletion rather
>         than under "Operations on dump"
>         "Get Dump details" should be shown under dump service
>         "Delete Dumps" should be shown under DumpService
> 
>             ----- Original message -----
>             From: Ratan Gupta <ratagupt@linux.vnet.ibm.com
>             <mailto:ratagupt@linux.vnet.ibm.com>>
>             Sent by: "openbmc"
>             <openbmc-bounces+devenrao=in.ibm.com@lists.ozlabs.org
>             <mailto:in.ibm.com@lists.ozlabs.org>>
>             To: "openbmc@lists.ozlabs.org
>             <mailto:openbmc@lists.ozlabs.org>" <openbmc@lists.ozlabs.org
>             <mailto:openbmc@lists.ozlabs.org>>
>             Cc:
>             Subject: [EXTERNAL] Redfish Dump Service Proposal
>             Date: Thu, Dec 12, 2019 5:09 AM
>             Hi All,
> 
>             Please find the redfish dump service proposal for the DMTF
>             attached.
> 
>             Kindly review and provide your inputs.
> 
>             Ratan
> 
> 
> 
