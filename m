Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 883FF32F1D5
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 18:53:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dsb1r3dlTz3dHL
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 04:53:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=VrZlRDqW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=VrZlRDqW; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dsb1d142fz30LP
 for <openbmc@lists.ozlabs.org>; Sat,  6 Mar 2021 04:53:08 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id u3so2827387ybk.6
 for <openbmc@lists.ozlabs.org>; Fri, 05 Mar 2021 09:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0ZytIUh3YxiXt2ZnkkINKTe9r61FnlCu8j4LquC94wo=;
 b=VrZlRDqWu5MRDRDuMy5JMBKHB4p3mS1FC5AvCoa/wIDPbkUbS1tN4lxbTMAEEJYVM6
 F+ZQPPKCNRjKwRG2f53U6c9cBFHoOrtkvHrFbMf8ATHm+mW8xcJowf0jKaKE83xwBJaJ
 NRN6L24cJ0yzR4/K/j3rjRFCdYKNphRAoqQIG1owmTc7awvZWng10jqEeDtz3YQdsgfd
 /ECiK7R5xmXBBhAdPcmQi5frBs+SL1Fh6/ZsoAua7x/HJXZuFYN8+FoGValMOtW5bpd6
 b5c1Ku0KMO8wgq8l9TFLxIeR5CwQh14G1MyU+bROcS4HBXD1qzroE/Gl19hfT72wpz/V
 KSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0ZytIUh3YxiXt2ZnkkINKTe9r61FnlCu8j4LquC94wo=;
 b=obE0mjpGusNkCkFiZue5Ir6W2R5amnqy7ct7ZY7ErjmQHDmwcAoHevQCjZgfYxf15s
 uL5NtWT2TzpTxwJH/nNqj84kDzAmBg+YuEHE5PioiEZqra47/VFCS99u1SWSiM5KJeZ/
 F0YTnK7eC5gY+WeRB6AZHEkJRWdxtbXtIDafkCeCv5Pb7pgYrzSVjlDCw2ybsg+MKXC2
 nd7hS6BMAgPPtJCzVIIHNB3hIPzpUrik92O6aN8mcIkBea/AiXFE1csMPtzmHcDsXyho
 U1BhClsbHMnBzvA7PEhkN+wvEdfZsopRr1pZ4uAEo/nQclkNsvhATN7Pv+8rqPglxNfN
 /phg==
X-Gm-Message-State: AOAM533u+2XiqC0LPOJLb4+LGZfrvL7ILi0+aUyFBimN5kddd1dXSWbJ
 7+wT9gBxcf/oF3QoTv1GQ/JVD97C3qFC7RlHfvzN0Q==
X-Google-Smtp-Source: ABdhPJx9fa+cQS53OnAEnTZJ678csEkFs8EkAWoFiubdbxaErA0dWLgpuytgED5JOjgpay7Cw3oSUnhxmNYXRQOD9ZE=
X-Received: by 2002:a25:8687:: with SMTP id z7mr14122680ybk.209.1614966784607; 
 Fri, 05 Mar 2021 09:53:04 -0800 (PST)
MIME-Version: 1.0
References: <PS2PR02MB35414D7358C4248DF668A4E790969@PS2PR02MB3541.apcprd02.prod.outlook.com>
 <6fafb378-5de7-74e3-4fef-17cb93d61c41@linux.vnet.ibm.com>
In-Reply-To: <6fafb378-5de7-74e3-4fef-17cb93d61c41@linux.vnet.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 5 Mar 2021 09:52:53 -0800
Message-ID: <CACWQX83ouxxsU+zqeix56feoHerQXJ9uKD+gmgfG8PDSoU6y1Q@mail.gmail.com>
Subject: Re: No option to delete SSL certificates
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
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
Cc: devenrao@in.ibm.com, "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, ojayanth@in.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 5, 2021 at 9:43 AM Gunnar Mills <gmills@linux.vnet.ibm.com> wrote:
>
> On 3/4/2021 8:52 PM, Mohammed.Habeeb ISV wrote:
> > In webui-vue , SSL certificates has only replace option. Delete button
> > is greyed out.
> >
> > Is there any reason for not providing delete option?

I can't explain why the TrustStore certificate isn't deletable, that
seems like a bug in webui-vue.

The HTTPS certificate isn't deletable because that would effectively
disable the HTTPS interface entirely, which seems like a problem,
given that you're currently using the HTTPS interface to communicate
with the BMC.  Because of that, we only support replacing the
certificate.  In a perfect world, we could regenerate a new
self-signed certificate if the old one was deleted, but nobody has
written that code so far as I'm aware, I suspect because it's just as
easy to replace the certificate with your own self-signed cert.

>
> Looking at the code, I believe the only certificate that can be deleted
> in bmcweb is the Trust Store Certificate
> https://github.com/openbmc/bmcweb/blob/feaf15005555a3099c7f22a7e3d16c99ccb40e72/redfish-core/lib/certificate_service.hpp#L1347
>
> And this is reflected in the webui-vue code:
> https://github.com/openbmc/webui-vue/blob/4da9495925d601bb4edfb8b007d5b54792b7491b/src/views/AccessControl/SslCertificates/SslCertificates.vue#L183
>
> I am not sure if there is a reason for not supporting deleting other
> certificates or just no one has done the work.
> https://github.com/openbmc/bmcweb/commit/07a602993f1007b0b0b764bdb3f14f302a8d2e26
>
> Thanks,
> Gunnar
