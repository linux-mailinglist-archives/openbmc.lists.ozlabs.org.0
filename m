Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 201CD13A34A
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 09:55:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xkmz05cNzDqML
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 19:55:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.27; helo=mail4.protonmail.ch;
 envelope-from=rgrs@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=default header.b=LiuTTHzD; dkim-atps=neutral
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xkmC182FzDqLD
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 19:54:30 +1100 (AEDT)
Date: Tue, 14 Jan 2020 08:54:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1578992065;
 bh=Zvceg7AWWvF1oW9H79aXl7FUEkatlvdk0jyJN8S3oYE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=LiuTTHzD6rdCnW8maPWZf1RqsEFci0gpTmYl/ssiuq8xgQyzAirCOfgZ+IqYZdQ8s
 GF7iSbzSLS8TC0r7TIpC933rectQRNxvviI/zzpMuFjW6ZPcz1n+PohSwxTcRTWhxC
 SvIBazuMQ7ux6UfcK0fPOdLTJgtycqd8KQZ7Frc8=
To: "Khetan, Sharad" <sharad.khetan@intel.com>
From: rgrs <rgrs@protonmail.com>
Subject: RE: MCTP over PCI on AST2500
Message-ID: <6axWSm1JIl2-OjQAyyRA_ERYs_12Zbb43hSZ2p2Ye4dOBtMtA-m5uE2wubhIKQvpv3I_KoSVnMi-ilXbotJSsqGb7tKkLOEBmys6VK8EHyM=@protonmail.com>
In-Reply-To: <865C376D1B77624AAA570EFEF73CE52F9E10E9A5@fmsmsx118.amr.corp.intel.com>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <62036de3-ce3d-4ccb-ac5b-15e9ba39d22b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10C8FD@fmsmsx118.amr.corp.intel.com>
 <92f857cc-303a-0d50-e0e4-2de2a8d19e41@linux.vnet.ibm.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10E9A5@fmsmsx118.amr.corp.intel.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.8 required=7.0 tests=ALL_TRUSTED,BAYES_50,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.2
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
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
Reply-To: rgrs <rgrs@protonmail.com>
Cc: "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Bhat,
 Sumanth" <sumanth.bhat@intel.com>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Sharad,

Please can you clarify what you meant by,

> "We are implementing this for AST 2600 (will not support any workarounds =
for AST 2500 bug)."

I'm assuming implementation will work with AST2500 (with vulnerabilities) a=
nd AST2600.

Is my assumption correct or did you mean no support for AST2500?

Thanks,
Raj

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Tuesday, January 14, 2020 11:24 AM, Khetan, Sharad <sharad.khetan@intel.=
com> wrote:

> Hi Deepak,
>
> On 13/01/20 10:23 PM, Khetan, Sharad wrote:
>
> > Hi Andrew,
> > On Thu, 9 Jan 2020, at 12:27, Andrew Jeffery wrote:
> >
> > > On Sat, 21 Dec 2019, at 10:45, Khetan, Sharad wrote:
> > >
> > > > Hi Andrew,
> > > > Sorry for late response.
> > > > The plan is to have MCTP in user space.
> > >
> > > How are you handling this then? mmap()'ing the BAR from sysfs?
> >
> > > Sorry, let me put my brain back in, I was thinking of the wrong side =
of the BMC/Host MCTP channel. How much were you planning to do in userspace=
 on the BMC? As in, are you planning to drive the BMC's PCIe MCTP controlle=
r from userspace (presumably via /dev/mem)?
> >
> > For implementation on the BMC, we agree that it's better to do it in ke=
rnel (and as you mentioned - use consistent interface to upper layers, prov=
ide another transport). However, given the time needed to implement things =
in kernel (and the review after), we are starting with a short term solutio=
n. We will be implementing MCTP (protocol elements) in user space, along wi=
th a low level MCTP PCIe driver just to push bits on PCIe. Iwona is working=
 on this and should be able to describe the exact primitive.
>
> Do you plan to do the user-space work as an extension to/reusing componen=
ts from openbmc/libmctp?
>
> Thanks,
> Deepak
>
> Yes we plan to reuse and extend the libmctp, support PCIe as well as SMBu=
s bindings. We plan to use d-bus extensions to existing libmctp. That said,=
 we will know the exact extent of reuse/modifications when we really start =
implementing.
>
> We are implementing this for AST 2600 (will not support any workarounds f=
or AST 2500 bug).
>
> @Andrew, Thanks for your response.
>
> Thanks,
> Sharad


