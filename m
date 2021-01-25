Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B64FA302BEF
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 20:49:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPgRF2KCFzDqyc
	for <lists+openbmc@lfdr.de>; Tue, 26 Jan 2021 06:48:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::429;
 helo=mail-wr1-x429.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=U64FKzZW; dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPgQ32hX1zDqWP
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 06:47:54 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id p15so7549626wrq.8
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2021 11:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6AI6/NG8ELSLNdhLfoe0RyotsBCa4qNfRnNFzCvthTk=;
 b=U64FKzZWBufNtKEpyYl8qWEF7B8xG9SBYOl5vSTp+bpd71bnfJlS3TqVWDc+eSLSUB
 UqI8fb/2EBrhdjPdIWiS6n6hpEOV+1YJvuP/3bWYkVZqK4uiFLb4QOHX1yWuzp+QHZS/
 1H8eKLwDXkRbIfDrCge3ykqqtFAPAVOMhJUBxcH1Txw1V36pIJnhiHh+7tClvwr4IBMN
 B/jzyt2PkChMYM0nEB8cxS4jydFK75jBAXA+z9fVk0oCifhArxpBPb6u+zjMOh0iSDtB
 J4pFqXg9qRYOHTt7MFJykM1yMliedocTwGrgxkqNMSnXBMgbOJYz/txeJNBo8BYcIcet
 QUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6AI6/NG8ELSLNdhLfoe0RyotsBCa4qNfRnNFzCvthTk=;
 b=gOLOUXXDpX2ixejL+RfTVX0PS8BB2nrC7qTb0oTRqSj+04VafFuab4e3Dhdvx7gDSo
 Fip4/MaZdUGgvLMdZITlN1FMogGu/eCF7fkhSgSlgRXkEXA695Nu2xL3XSsbSqaCjAx6
 cWAp7M08++yeiIiMHEgQ/xTVSJEDzyV0/Z/VVVw/AL7Gp0xGNyxzn8dtEiFLxPKypR5X
 k3nbVvo7MJFxthiupxvbr/Cdqg+SKr0TD4CXwxp183TS44wdwlILrNcNjxsQ+zvvsjxn
 1TqDj5n5SN+auVQ2OCBuNWDARdyd2LjnQ71A0Bj54/i0IEMyKWpQtdBqM2iNuypnArAG
 paPw==
X-Gm-Message-State: AOAM5335/2kVLNQ3bQirIn549nsr5v0zoYOSyUni16ohBUvsP4CMd955
 oSK23b1kl0EHj1RPhZopjvExQCnYoZV1XSsAjDZUHw==
X-Google-Smtp-Source: ABdhPJz6gfx8bMHE1uOcT0N3nrhuAgx+lDgw7QE6CnEL+JBt92TWhxtWCZatJRiC3dJZ8V9pMEKNksGvmMriZq84mjY=
X-Received: by 2002:adf:d20c:: with SMTP id j12mr2639962wrh.407.1611604069143; 
 Mon, 25 Jan 2021 11:47:49 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR19MB356141B80B3FDB392843099195BE9@DM6PR19MB3561.namprd19.prod.outlook.com>
In-Reply-To: <DM6PR19MB356141B80B3FDB392843099195BE9@DM6PR19MB3561.namprd19.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 25 Jan 2021 11:47:37 -0800
Message-ID: <CAH2-KxD-e2P1O+yE8E4qzkUhB7MtTZcHJO-CWs7nptTNnrATcQ@mail.gmail.com>
Subject: Re: OpenBMC Logging Implementations: Interfaces and Error Messaging
To: "Giles, Joshua" <Joshua.Giles@dell.com>
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 openbmc <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 25, 2021 at 11:05 AM Giles, Joshua <Joshua.Giles@dell.com> wrot=
e:
>
> Hello All,
>
>
>
> We=E2=80=99re hoping to get clarity in two areas of Logging with the aim =
of proposals to benefit all.
>
> These are interfaces and error messaging=E2=80=A6
>
>
>
> Logging interfaces
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Webui-vue appears to only display redfish Event Logging whereas =E2=80=9C=
legacy=E2=80=9D phosphor-logging is used by things such as generating SNMP =
traps.
>
>
>
> Question: Will legacy event logging be deprecated in OpenBMC in favor of =
Redfish logging?  If not, do we merely access legacy logging out-of-band vi=
a rsyslog?
>
>
>
> Error Messaging
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> There appears to be some duplicate/unique error messages amongst the two =
implementations:
>
> Phosphor-dbus-interfaces: e.g. https://github.com/openbmc/phosphor-dbus-i=
nterfaces/blob/master/xyz/openbmc_project/Sensor/Threshold/Critical.interfa=
ce.yaml
> Redfish message registry: e.g. https://gerrit.openbmc-project.xyz/c/openb=
mc/bmcweb/+/34510/4/redfish-core/include/registries/openbmc_message_registr=
y.hpp (SensorThreshHoldCriticalGoingHigh)
>
>
>
> Question: Will the unique =E2=80=9Clegacy=E2=80=9D errors defined in the =
phosphor-dbus-interfaces be available in the redfish message registry?  Is =
there a plan to consolidate these moving forward?

I have no plans for this, nor have I seen a design for consolidating
the two.  Today, they're different because Redfish log endpoints have
very different requirements than phosphor-logging interfaces were able
to provide, with that said, I'm open to there being a much simpler
design that could work well here, I just haven't applied a lot of
brainpower to trying to get them consolidated.

>
>
>
> -Josh Giles
