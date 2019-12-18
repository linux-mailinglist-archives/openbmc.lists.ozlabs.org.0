Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80194123DE2
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 04:26:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d0mb5tsNzDqV3
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 14:26:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2e;
 helo=mail-vk1-xa2e.google.com; envelope-from=dhruvaraj@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WciMgEep"; 
 dkim-atps=neutral
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d0lm10k7zDqR0
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 14:26:11 +1100 (AEDT)
Received: by mail-vk1-xa2e.google.com with SMTP id h13so233052vkn.10
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 19:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yTeZcaekVHHbp4com6XSedlJGCmjGTEGvV/EAFZ7t3M=;
 b=WciMgEepmGviwX/rHdNbkFEJUo3zN5JX6ef8w7sJNpEBkO9CPixTKgqlm9TEj2ULMt
 c/XlyTiCJbYBpr/Jpa+quSm43vD8VDvUQrEtaH8ubPDbmueL7mPF+bKxktNrcvyNViRg
 hIt8KvuA9B8DctajmeJnVT0RR6xT+WRwk0ZF6MCdkp92ciPVcoUPZSa8QZGJbFR+vwv7
 dFaBunaoimo3d3PvHCB/fHKle+g81ZHozv+HBVLXEQbY4yUqKTNtFutcpsgXlGc9DAfc
 vyVV1vEcvS69M6B0ohLu2JLPzobCVP0Lb3aZVABXIw5576gXNNo3pgWGUhY6J+o/3aRe
 sIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yTeZcaekVHHbp4com6XSedlJGCmjGTEGvV/EAFZ7t3M=;
 b=uWh/LWuAHS1cEUegk2wHCqQTJirUD2TeYGUSzOZg4JZkAVopPakkmos7HOstkIzFG6
 B/4eK9TWq5EV0UD37qjfKwUnD2kuWoD15aO8bfrqZkB8XmlEAhnNZ29QHyL/cgb87d6D
 BZNUELOj5sCHD6H8Xl3FTCwj4sdXgqDkLujw7zZ6tNzKBMDYOUZk27lkcQUYIubYxlQX
 mB5WWG3BE7UDAmpEyNehWH0ENcVOAo5FWUALYIR+z0wq2dAOCpFi9LQhoDBdXZcWOBJe
 Pc/zZ3A6F6jg0BJTopUaxAKnNfQ5/WYOiJjTdAiqlQ7XJ5z/i75DDVXaIkDlpopbgdxc
 f0+Q==
X-Gm-Message-State: APjAAAUfjqdrT25pxpE6CHh4TjHApyR78oe1GXlOUbIkHF+D33p6ntHi
 eIFbNeDaUYFCkywxYTp6NBZkygugyaT2OiR0Wao=
X-Google-Smtp-Source: APXvYqyKysKni6myQyxU6TY1Z8KSOtP30nvSXrNXDAQbdt3MCqGwEt2lYvjU4AGDnyO7dVYaeD8r94DKJCZp+P7760s=
X-Received: by 2002:a1f:6344:: with SMTP id x65mr209985vkb.26.1576639567516;
 Tue, 17 Dec 2019 19:26:07 -0800 (PST)
MIME-Version: 1.0
References: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
 <OF3E82A637.78F050C7-ON002584CE.0025B2F4-002584CE.00271DE9@notes.na.collabserv.com>
 <CAH1kD+YfetwAmGQfjF4ytCQYhhaEorgdiA5svwjm7X91-yG1Tg@mail.gmail.com>
 <CACkAXSpCwhUwzh1uZMMkFvtkO7Tdi4xoHaq1KtaAndR8pR2gbA@mail.gmail.com>
 <ac75a152-9bdf-0029-67e8-60e4e99eb1cc@linux.intel.com>
 <CAK7WoshJ7xMhB_E-ZEpVR+1E_AuGpZfGUFToOihoC5hZ9xyGGg@mail.gmail.com>
In-Reply-To: <CAK7WoshJ7xMhB_E-ZEpVR+1E_AuGpZfGUFToOihoC5hZ9xyGGg@mail.gmail.com>
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Wed, 18 Dec 2019 08:55:55 +0530
Message-ID: <CAK7WoshsUE2+GXGEgxe99vkz4aEYTdT_ZcNE_k4Y_6x7JLWsTQ@mail.gmail.com>
Subject: Re: Redfish Dump Service Proposal
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, 
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi,

I have an additional comment on creating the dump, there are some
dumps which can take longer than an hour on certain systems and BMC
has no control over its execution. Can we have an additional interface
similar to approach 2 in creating a user-initiated dump named
'Initiate Dump'? Which just initiate the dump asynchronously, without
returning an ID, and such dump will get generated at a later time and
a redfish resource for that dump will be created after the generation.

lPOST https://${bmc_ip}/redfish/v1/DumpService/Actions/InitiateDump
dumpType=BMC/Host/<or a different type>

The main difference from approach 2 in CreateDump is, no redfish
resource for the dump will be created after initiating but only after
the system generated the dump.

On Sat, Dec 14, 2019 at 10:57 AM dhruvaraj S <dhruvaraj@gmail.com> wrote:
>
> Few comments..
>
> On Sat, Dec 14, 2019 at 1:32 AM Bills, Jason M
> <jason.m.bills@linux.intel.com> wrote:
> >
> > I like this as well.  I'm trying to support a CPU crashdump that would
> > fit perfectly with this proposal.
> >
> > A question and some comments below:
> >
> > Will Dump only have the two types: BMC and Host?  Could this be more
> > flexible to allow for multiple different types of dumps from various
> > components?
> + I think dump types should be flexible to cover different types of
> host or bmc dumps from different components with varying formats.
> >
> > On 12/12/2019 9:46 PM, Jayanth Othayoth wrote:
> > >
> > > Dump is an additional debug data associated  to an error event.
> > >  From the phosphor-debug-collector  perspective,  BMC Dump collects
> > > additional debug information, which canot be contained in the error log.
> > > Please find my comments inline.
> > >
> > > On Fri, Dec 13, 2019 at 6:27 AM Richard Hanley <rhanley@google.com
> > > <mailto:rhanley@google.com>> wrote:
> > >
> > >     Hi Ratan,
> > >
> > >     I think this service is a really good idea.  A couple of thoughts:
> > >
> > >     1) I don't think the semantics around the Download action are
> > >     consistent.  Generally actions are reserved for stateful changes,
> > >     and only have post methods.  I think this could be simplified by
> > >     putting an @odata.id <http://odata.id> in the Dump resource that
> > >     points to the raw dump file.  Then clients can do a normal HTTP get
> > >     on that URL.
> > I agree.  Currently, I have crashdump as a LogService, so it is very
> > easy to list and download the dumps using the standard
> > LogService/LogEntry resources.
> >
> > >
> > >     2) I'm wondering what is the best way to communicate what MIME type
> > >     the raw dump supports.  In theory that could be a part of the
> > >     RawDump resource.  However, a case could be made that it should be
> > >     put into the Dump resource.
> > >
> > >     3) Perhaps the dump service should be embedded into other resources,
> > >     instead of being a top level service.  I'm imagining something like
> > >     how the LogService is setup.  That way there are a lot fewer
> > >     dumpTypes for any particular instance of the service.
> > >         a) This could be taken to the extreme, and the DumpService could
> > >     be integrated with the existing LogServices.  This would mean adding
> > >     in a new log type, and having a new action >
> > >     +Agree with this suggestion to embedding dump under log service as
> > >     new EventType.  Also need an association  for each system generated
> > >     dump with an error event.
> > Yes.  I think it would be better to integrate with the existing
> > LogServices.  The existing resources already provide a lot of what is
> > needed, so we can leverage that.
> +Agree with integrating dump under LogService, The id of the dump can be
> unique to dump type, so something like Dumps/<DumpType>/<id>?
> >
> > The idea that I'm currently using is instead of providing the dump
> > content directly in the LogEntry, it provides a URI where the dump can
> > be downloaded.  I was thinking of proposing to add a "Uri" property or
> > EntryType to LogEntry to support this.  That would allow many different
> > types of dump data to be included without having to specify the content
> > (similar to how the MessageRegistryFile and JsonSchemaFile resources
> > work today, perhaps defining a DumpFile).
> >
> > With support for LogService, the DumpService would really only need to
> > add support for the "Create" action and all logs would be available
> > under the corresponding dump LogService.
> >
> > For the asynchronous create, the Redfish Task Monitor seems like the
> > right solution to handle the dump as a long-running task.  That way the
> > create command can immediately return and provide the Task Monitor to
> > track completion.
> +Yes, for some types of long-running dump tasks, the dump id may not be
> available immediately, The  response body with the dump id can be returned
> once the operation is completed successfully.
> >
> > In the meantime, I am using the LogService to track when the newly
> > created entry becomes available.
> >
> > >
> > >
> > >     4) It might be a good idea to have some event support in the cases
> > >     where a dump is created because of a machine crash.
> > Wouldn't we also get this by leveraging the LogService?
> >
> > >
> > >     Regards,
> > >     Richard
> > >
> > >     On Wed, Dec 11, 2019 at 11:08 PM Devender Rao <devenrao@in.ibm.com
> > >     <mailto:devenrao@in.ibm.com>> wrote:
> > >
> > >         Over all the schema looks good. Few observations for clarity,
> > >         also how about we have multiple collection say
> > >         HostDumpCollection, BMCDumpCollection  and also a new service
> > >         DumpLocations similar to "CertificateLocations"
> > If we use LogService, each of these collections could just be a separate
> > LogService.
> >
> > >
> > >         Page 17: Dump Creation flow
> > >         1. The time line diagram should show that "Request to create
> > >         dump" return immediatley. The redfish client will be notififed
> > >         asynchronously when the dump is collected through DumpCollected
> > >         event. Request for dump with resource id should be in the same
> > >         time line when it gets notified of Dump collection completed. >         Page 19: For clarity
> > >         "List Dumps" should be shown as part of DumpColletion rather
> > >         than under "Operations on dump"
> > >         "Get Dump details" should be shown under dump service
> > >         "Delete Dumps" should be shown under DumpService
> > >
> > >             ----- Original message -----
> > >             From: Ratan Gupta <ratagupt@linux.vnet.ibm.com
> > >             <mailto:ratagupt@linux.vnet.ibm.com>>
> > >             Sent by: "openbmc"
> > >             <openbmc-bounces+devenrao=in.ibm.com@lists.ozlabs.org
> > >             <mailto:in.ibm.com@lists.ozlabs.org>>
> > >             To: "openbmc@lists.ozlabs.org
> > >             <mailto:openbmc@lists.ozlabs.org>" <openbmc@lists.ozlabs.org
> > >             <mailto:openbmc@lists.ozlabs.org>>
> > >             Cc:
> > >             Subject: [EXTERNAL] Redfish Dump Service Proposal
> > >             Date: Thu, Dec 12, 2019 5:09 AM
> > >             Hi All,
> > >
> > >             Please find the redfish dump service proposal for the DMTF
> > >             attached.
> > >
> > >             Kindly review and provide your inputs.
> > >
> > >             Ratan
> > >
> > >
> > >
>
>
>
> --
> --------------
> Dhruvaraj S



-- 
--------------
Dhruvaraj S
