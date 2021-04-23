Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC85369732
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 18:37:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRg222xTrz300c
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 02:37:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=t++GJjlX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=t++GJjlX; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRg1p43mlz2xZP
 for <openbmc@lists.ozlabs.org>; Sat, 24 Apr 2021 02:37:32 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id w4so45263786wrt.5
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 09:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G0JgIKqPVQRgRoJhk50ymlUYd5sSFftLVfsMpCJrLSo=;
 b=t++GJjlXqiN6E0F48TnAS6d/RPgYiwlc62ks+n3HvT3Zv6dot4WsNkjpqy7Vr5I/Aq
 QevIHbQXgiyWbhL+coJAghY1QcgjrSOfoA3zRT+X/YJryJae+P8+z9wEKG2ZTICUpK8T
 i2DqswdrpWKewLCpjNEiXePT6vismM1BzHMloI3JqR1n53ISjSA7MPkIXM1mMQbZUByw
 PNZVn/0li+1Gag8zmKgQQq7Bamr2TlTeNcUp+hUhM8fTVufq8rGFmf/qbxpe7nxblgs2
 N1HUbW5ySA1+nwQnxjLhzn6YHEeaClCTH6uGLZr+IAkRsW5kT7OIka1q7rpKbThkTqNv
 4CjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G0JgIKqPVQRgRoJhk50ymlUYd5sSFftLVfsMpCJrLSo=;
 b=sUS3wVDTWeNgbiAPqq04OpTfixMu2S4rdQCuu2PEGz/85njQ7MjKtEpaQ9n7d1+jKN
 07lv1rHvfodHGsw9lBV9j5qCTpcGzOzFYqF3fyqqk0TJ2NofxBibogUVjoMdWoJnqoKe
 NXjEP4WZEAz1T9ecsen5DGsuyJDdzy14b7jZvlUXI5QCvBqyDGYUT6m3O2Ek9gcX2WeS
 +Hv2sv6mqsYpNUm48oGweuwANwgMwivbj3OcmuM6io1PcJr435KDaXnRsl6hDLdcjy1E
 IlsC3j0OxkppwsFXeEAzyCoPds6sAH96EFZWCKD7kB846YvqTAO6a/E3KjmbbMo+yXAk
 f5fQ==
X-Gm-Message-State: AOAM533Y2AG0f5iGK48t6DDt25D0KdI1Etazv+sRoDaLoKoRSVUkADyg
 RVoI2S02q8GK4yh2ssUwN1RtKSFAN2tYbYPlfJKycw==
X-Google-Smtp-Source: ABdhPJwk1DyDFuQbCx5X+M3AnGqvDvo1/chSqtDJ9yza7KzwyV5EUPSDkTZzpuOB+kSr3bcqIio40W1SUCdmoksiwTI=
X-Received: by 2002:a05:6000:1204:: with SMTP id
 e4mr5798134wrx.424.1619195843781; 
 Fri, 23 Apr 2021 09:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAMXw96PmAoSb5LJj-CzYA-47D-nCy81gBa=T94N_u2fqWL54EQ@mail.gmail.com>
 <10871.1618685448@localhost>
 <CACWQX8166T=3-ZKo+EtC-e67KzTgfgh0JxKA3G3ap1LVucbQYg@mail.gmail.com>
 <YILK8BCaKDbVnad+@heinlein>
In-Reply-To: <YILK8BCaKDbVnad+@heinlein>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 23 Apr 2021 09:37:12 -0700
Message-ID: <CAH2-KxBWxHkSwKbfkymTV8amdGQAcdtrnG0+bphVtq9FKPDfxg@mail.gmail.com>
Subject: Re: bmcweb: Install encrypted certificate to BMC
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: Justin Chen <juschen@google.com>, Michael Richardson <mcr@sandelman.ca>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Richard Hanley <rhanley@google.com>, gmills@us.ibm.com,
 Zhenfei Tai <ztai@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 23, 2021 at 6:26 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Mon, Apr 19, 2021 at 12:18:15AM -0700, Ed Tanous wrote:
> > On Sat, Apr 17, 2021 at 11:56 AM Michael Richardson <mcr@sandelman.ca> wrote:
> > > Zhenfei Tai <ztai@google.com> wrote:
> > > If you have a daemon present that can decrypt things, then you already have a
> > > private key (or symmetric key) present, and that key is subject to attack.
> > > (Unless you add yet another layer of indirection via TPM chip....)
> >
> > This wasn't clear in the initial email, but yes, this would be a case
> > of exactly what you described in the "unless" part.  The TPM-like chip
> > has a specific format that we're hoping to upload to it through the
> > OOB interfaces that would give it a form of identity.
> >
> > >
> > > I strongly recommend that you do not invent new technology here.
> > > EST (RFC7030) is considered the best technology here, with SCEP (RFC8894)
> > > being a legacy choice.
> >
> > I read through that spec a bit.  The issue there is that it has no
> > compatibility with Redfish, so implementing that would be yet another
> > subsystem to build and maintain, and wouldn't work in tandem with
> > Redfish aggregators once the key was decoded.  While I wouldn't be
> > against anyone implementing that on OpenBMC, that wouldn't meet the
> > needs of what we're trying to accomplish;  Also, it isn't clear that
> > RFC8894 has provisions for custom certificate formats, of which this
> > would definitely be one.
>
> There really isn't much in Redfish (or our dbus interfaces) about TPMs.
> I think that provisioning and attestation are two big functional areas
> that are coming to the forefront.  It would be nice if someone with
> bandwidth and access could pave the way on the Redfish side of things
> for TPM management.  I am certainly interested in the attestation end.

FYI, Redfish just added SPDM support via the MeasurementBlock property
in the SoftwareInventory schema.  Might be worth looking into for the
attestation case.

>
> --
> Patrick Williams
