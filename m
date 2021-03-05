Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7AF32F49B
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 21:29:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsfTY5hMMz3dHb
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 07:29:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=xnOsiGwu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=xnOsiGwu; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsfTK03sCz30NW
 for <openbmc@lists.ozlabs.org>; Sat,  6 Mar 2021 07:28:50 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id h82so3231113ybc.13
 for <openbmc@lists.ozlabs.org>; Fri, 05 Mar 2021 12:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QGEW/MPj/xJYnatQW2O2vtAKo1G4C9bPCO27K3jp5rg=;
 b=xnOsiGwucTZTV02LQo+3fjXXFPTMJFoLwgahMZoN9dce1prEm3PZH0qxEiFEEHdiEY
 wKjz1dumx+zltV6ihalQhi0z9WWLQFbMWAxlvu2q7uY+DHSTq3OV8BGCkvL+akVAkwCw
 VgeFUQKqJsjFm6BaJw038RKFHda1qJwhOXXocJa3LWsuZFgL3qNHFUO4sEU9yvPRjWAo
 NbB1iHom0SkAWfJH4QLBVDfzJQUo3p9zOxrpwq7uINVNDUTlT+wjeE2ewP9PDOdl8TSO
 golFoWkODpbsOG0Dqvpx/R1RP5UIU2Xz+c9w2CgdUtEZLeDZyuUH9oum8jiRhJekLgAt
 iF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QGEW/MPj/xJYnatQW2O2vtAKo1G4C9bPCO27K3jp5rg=;
 b=Tylq+TWsb0NUkgvtlZUO9coICqxlmhyYtFgYO+tGMMDEmMYqB07SgtRb1ChBlEhpb0
 0dKBR4720t9VWvoJ7fIneyCfMnkE3AiI0ymzri64lhK2E8oimDEvh1nJCHANJWjHdJQx
 X27ak0x5354CDzWBSDVegz5n8np5ymR2WHBxDL/W9UQasSFTNIcVll4aNyHyUovgE2zB
 LVmsSA48sHRygvo4HuOyNcqEsntFkAZ+COLb3HD3yyi35cwXN/V5IRalQmXt/4+okr/j
 6QXKShpkzilsHIal4BV8UutxDFcaTKSFP+LeoyJ48Qm0zEpTKupOXAQl5jiakufULIDI
 wZnw==
X-Gm-Message-State: AOAM530GkDYnStIH5S8Sin24vrEzyNe5vm0Q2XorsHULlYH5LPtzFNcF
 2HavYCSB0U/eTDQ8QBho7xwkI0V8nW0tvlfyS+KS0w==
X-Google-Smtp-Source: ABdhPJzFYtMIjI/et+mr0fzOIyCcQXnIsysH4c+YSXsjwXbow4OU5I0FtG6+WnUCnAYxSh69SBxWC7y44hhHY/gVfVI=
X-Received: by 2002:a25:d251:: with SMTP id j78mr15290610ybg.480.1614976126513; 
 Fri, 05 Mar 2021 12:28:46 -0800 (PST)
MIME-Version: 1.0
References: <PS2PR02MB35414D7358C4248DF668A4E790969@PS2PR02MB3541.apcprd02.prod.outlook.com>
 <6fafb378-5de7-74e3-4fef-17cb93d61c41@linux.vnet.ibm.com>
 <CACWQX83ouxxsU+zqeix56feoHerQXJ9uKD+gmgfG8PDSoU6y1Q@mail.gmail.com>
 <OF78757961.7D9FD99E-ON0025868F.0066A7C0-0025868F.0066A7C9@notes.na.collabserv.com>
In-Reply-To: <OF78757961.7D9FD99E-ON0025868F.0066A7C0-0025868F.0066A7C9@notes.na.collabserv.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 5 Mar 2021 12:28:35 -0800
Message-ID: <CACWQX80qvHZ2HSvmgeLcJ_X5ZYwRDb-6cw6nOKb6qd_9V971FQ@mail.gmail.com>
Subject: Re: No option to delete SSL certificates
To: Milton Miller II <miltonm@us.ibm.com>
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
Cc: Devender Rao <devenrao@in.ibm.com>,
 "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jayanth Othayoth <ojayanth@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 5, 2021 at 10:41 AM Milton Miller II <miltonm@us.ibm.com> wrote:
>
> On March 05, Ed Tanous wrote:
> >On Fri, Mar 5, 2021 at 9:43 AM Gunnar Mills
> ><gmills@linux.vnet.ibm.com> wrote:
> >>
> >> On 3/4/2021 8:52 PM, Mohammed.Habeeb ISV wrote:
> >> > In webui-vue , SSL certificates has only replace option. Delete
> >button
> >> > is greyed out.
> >> >
> >> > Is there any reason for not providing delete option?
> >
> >I can't explain why the TrustStore certificate isn't deletable, that
> >seems like a bug in webui-vue.
> >
> >The HTTPS certificate isn't deletable because that would effectively
> >disable the HTTPS interface entirely, which seems like a problem,
> >given that you're currently using the HTTPS interface to communicate
> >with the BMC.  Because of that, we only support replacing the
> >certificate.  In a perfect world, we could regenerate a new
> >self-signed certificate if the old one was deleted, but nobody has
> >written that code so far as I'm aware, I suspect because it's just as
> >easy to replace the certificate with your own self-signed cert.
>
> There was also discussion (but I don't remember if it was email
> or in a gerrit review) that deleting invalid certificates was
> a bad idea when they are invalid for the current time because
> sometimes the issue is the loss of the real time clock, and we
> don't want to delete what should be a good cert and replace with
> a self signed one just because the RTC is wrong.

I think that's a different issue.  This is talking about the actual
delete API a user would request.

>
> Deleting the current cert can cause issues with certificate
> pinning in the browser.

You're either talking about HSTS, which isn't affected by certificate
changes, or you're talking about HPKP which we've never supported in
bmcweb, and I thought the browsers removed support for it anyway.
Either way, I don't think it's a concern in OpenBMC in this case.  We
can (and expect to in a security conscious org) replace the
certificate at will often.

>
> >>>
> >> Looking at the code, I believe the only certificate that can be
> >deleted
> >> in bmcweb is the Trust Store Certificate
> >>
> >https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_openb
> >mc_bmcweb_blob_feaf15005555a3099c7f22a7e3d16c99ccb40e72_redfish-2Dcor
> >e_lib_certificate-5Fservice.hpp-23L1347&d=DwIBaQ&c=jf_iaSHvJObTbx-siA
> >1ZOg&r=bvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=GvsftEwmNCL39tSW
> >9RGR21w8wiSqAcgIUtjTN26kt-I&s=4FlXy5_5pFttulDVBgxnYBpZTTWQNlWVwxr8jkW
> >aJBc&e=
> >>
> >> And this is reflected in the webui-vue code:
> >>
> >https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_openb
> >mc_webui-2Dvue_blob_4da9495925d601bb4edfb8b007d5b54792b7491b_src_view
> >s_AccessControl_SslCertificates_SslCertificates.vue-23L183&d=DwIBaQ&c
> >=jf_iaSHvJObTbx-siA1ZOg&r=bvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4
> >&m=GvsftEwmNCL39tSW9RGR21w8wiSqAcgIUtjTN26kt-I&s=pc4yE_OEI6ePP--E_F8p
> >Shj3Ve0pOiAANBMLi8YPeHY&e=
> >>
> >> I am not sure if there is a reason for not supporting deleting
> >other
> >> certificates or just no one has done the work.
> >>
> >https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_openb
> >mc_bmcweb_commit_07a602993f1007b0b0b764bdb3f14f302a8d2e26&d=DwIBaQ&c=
> >jf_iaSHvJObTbx-siA1ZOg&r=bvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&
> >m=GvsftEwmNCL39tSW9RGR21w8wiSqAcgIUtjTN26kt-I&s=iAukDzsq2iqjh1UJw1y0b
> >Lv7ci9m2WLqKdF634OdPs8&e=
> >>
> >> Thanks,
> >> Gunnar
>
> milton
>
