Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EA830EFC5
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 10:36:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWYMk1rDLzDwrh
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 20:36:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e36;
 helo=mail-vs1-xe36.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r6q12O/0; dkim-atps=neutral
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWYLT2SV2zDqV8
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2021 20:35:12 +1100 (AEDT)
Received: by mail-vs1-xe36.google.com with SMTP id i12so1412835vsq.6
 for <openbmc@lists.ozlabs.org>; Thu, 04 Feb 2021 01:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9ATckLjja9AnzNTpiYKs01QxkAsKnTaJvn90vVFbPkI=;
 b=r6q12O/0xkG6C7tosBXTMDEunhy2lvT2WF9WeCe5hEp2u0hOVrhzkmlox6LdbcaIgi
 OxU1o9Mfe0bKLUokFmpoS/sO7DaqVrxJ7oALCh7AHqMHQxHrzj4brfLywjAvRRA0jmzg
 AHYEiAxouexaUX49VWaASdrj2POwYmzn/ggvCUFOwajnC4B2nvy1gUJnjhEC8BhYUbjW
 qqSGJXCwWK/mPUdZ+UPCnIQKa5bCwYffIFMkznTPPU7x4EKa7RxvD/aaWYci0pfUuLzh
 YdERRCioF5i3x2t61MWyIBOwu2LLt+tP88TbMfAPqFCd2+m5AmF9n63VxClZ/A+v7UV+
 xwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9ATckLjja9AnzNTpiYKs01QxkAsKnTaJvn90vVFbPkI=;
 b=irsjz0btip2s7MDoIeAtsWLy+MAx0lUkt8zDunDEO9LePvk8duhYOf2YvhPkoGEz+o
 OuGRMEl2iovU01DL8ohX10bqBpEkgjtna94nt4XymaXGfb/XSBRwOf6dcwTJJitWrpCp
 Jamb4MDectxY5SYyw0YKWWOExostmehdK4TJg41zGl/7CVCgBeJ62dJyQ3VBupWO/h7P
 XJoa72ACh6nLecnDqW7JVOq/hu+AohJDHPkY7YR8P7wv+dkYIX4RZOqgzxa7OUkrf15G
 BFgVcaYO5IgfmYmzliMVDci1IHC0nJ4VzNiJeFj9GTMJySZnsbc1crUjY/0wSJTWH/5D
 0CEA==
X-Gm-Message-State: AOAM531YvzlVOMh48cMDsmFTRJIiUMjzYiZGtuSAtm5LMLsIGcjD7A+4
 BjAO9FznATiu9Tprxjbh+vIhB2N/7zoha4PJv2o=
X-Google-Smtp-Source: ABdhPJwVrVUEh86vwXHjFcx0zt8WcU9uDWjqQzxsrNT7e53ByAKQAt0ln9dl35jiCr2ZaEq8It9suTyoqRpL/qlQyns=
X-Received: by 2002:a67:f2d7:: with SMTP id a23mr4453642vsn.22.1612431309134; 
 Thu, 04 Feb 2021 01:35:09 -0800 (PST)
MIME-Version: 1.0
References: <YBi83kwe6SZqkcq0@heinlein>
 <92FA1C68-B326-4562-97DB-0D1D56648197@getmailspring.com>
In-Reply-To: <92FA1C68-B326-4562-97DB-0D1D56648197@getmailspring.com>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Thu, 4 Feb 2021 15:04:58 +0530
Message-ID: <CAM=TmwXhvPaVfrugd__e8gmgaRw8YBuO9DwhAiRKm+iAUP=KbQ@mail.gmail.com>
Subject: Re: Progress Codes in BMC
To: manoj kiran <manojkiran.eda@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "kunyi731@gmail.com" <kunyi731@gmail.com>, "ed@tanous.net" <ed@tanous.net>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "anoo@us.ibm.com" <anoo@us.ibm.com>,
 "gmills@linux.ibm.com" <gmills@linux.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "vishwa@linux.ibm.com" <vishwa@linux.ibm.com>,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 "vijaykhemka@fb.com" <vijaykhemka@fb.com>, "wak@google.com" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Manoj,

On Thu, Feb 4, 2021 at 2:17 PM manoj kiran <manojkiran.eda@gmail.com> wrote=
:
>
> Hi All,
>
> Thanks to everyone for all the implementation ideas on this thread.
>
> After understanding all the inputs from the community , we were planning =
to proceed forward with using the existing infrastructure provided by phosp=
hor-host-postd, phosphor-post-code-manager repo's & leverage the BIOS POSTC=
ode Log service to do the job.
>
> The plan is to start with minimal working pieces. On the first go we are =
planning to come up with patchsets that will do the following:
>
> 1.Come up with a compilation flag & make sure phosphor-host-postd still h=
osts the dbus interface even if it does not see the snoop port.

Is there a benefit of using phosphor-host-postd as opposed to pldmd
implementing the Boot.Raw interface (i.e if you take out the snoop
part, does it do anything else than just hosting a D-Bus object)?
Post-code-manager should still work as-is. If you use host-postd for
this and if pldmd makes a D-Bus call to write Boot.Raw as a client,
that seems like one additional D-Bus call to get a code out via
Redfish.

Thanks,
Deepak

> 2.PLDM will receive the 72bytes of progress code from the hypervisor via =
File I/O, and then just send the first 8 bytes(discard everything else) to =
the existing Raw Property & use the existing redfish BIOS Post Code log ser=
vice to check if things are working.
>
> In the next iteration :
> 1. We will try to modify the existing dbus property (Boot.Raw) to array[b=
yte] & the piece of code that uses this property in other repos including t=
he post-code-manager.
> 2. There might be a need to Modify/Add new interfaces used by post-code-m=
anager to parse the buffer & host the dbus objects to such an extent that a=
n AdditionalDataURI can be given to clients(base64 encoded buffer) apart fr=
om filling the existing redfish message registry.
>
> Does the community foresee any issues/problems if we stick to the above-m=
entioned plan?
>
> Thanks,
> Manoj
>
> On Feb 2 2021, at 8:15 am, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Mon, Feb 01, 2021 at 07:21:39PM -0500, Brad Bishop wrote:
> > On Sat, Jan 30, 2021 at 08:31:26AM -0600, Patrick Williams wrote:
> > >On Wed, Jan 27, 2021 at 08:05:26PM -0500, Brad Bishop wrote:
> > >>
> > >> There are multiple sources of the codes - on Power the power sequenc=
ing
> > >> is done on the BMC and that is considered part of the server boot so=
 we
> > >> have both those applications indicating their progress along with th=
e
> > >> more traditional progress flowing down from system firmware.
> > >
> > >The `xyz.openbmc_project.State.Boot.Raw` is the interface to use here.
> > >You just write the `Value` property.
> >
> > Ok. Do I have it right - on any application that wants to post a
> > "progress code" you would just implement this interface on a single
> > (arbitrary?) path and continually write to the Value property?
>
> I think it is even simpler than that. You just need to make a dbus
> client call to write to the Boot.Raw value. This might happen from your
> boot sequence on the BMC-side or from PLDM for the Host-side.
>
> You will want the phosphor-post-code-manager application running, which w=
ill
> listen to the PropertyChanged signals from Boot.Raw and keep the running
> history for you.
>
> There is also phosphor-host-postd. Currently it has an implementation
> that looks at LPC to get the post codes. There was a proposed
> implementation [1] that added multi-host support and I think support to
> get the value directly from dbus client writes to Boot.Raw instead of
> the lpc-snoop method. Then there is code in fb-ipmi-oem that writes the
> results of some IPMB messages into the Boot.Raw value[2]. Looking at
> this I'm not positive that all the pieces are all there, but I think it
> is mostly there. Maybe check with the author on 1 to see where it is
> at.
>
> This design doc might be useful too [3].
>
> 1. https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-postd/+/365=
09
> 2. https://github.com/openbmc/fb-ipmi-oem/blob/master/src/biccommands.cpp=
#L76
> 3. https://github.com/openbmc/docs/blob/master/designs/multi-host-postcod=
e.md
>
> --
> Patrick Williams
