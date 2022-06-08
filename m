Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C97F0543CA9
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 21:18:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJH8951Mvz3bnM
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 05:18:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YmsOPMmy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YmsOPMmy;
	dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJH7k5hGgz3bd4
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 05:18:25 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id m26so18152277wrb.4
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jun 2022 12:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ELSjbPI242d4A9Dvrq1gpvvqgp04MYX2PuvwmepyYl8=;
        b=YmsOPMmyjQZyRZ4CDVNWDEJQWfIgMnc8X9HK9abVqCJ2iGjoqRK4AQaKKeN3TVCBGe
         QWs+v+k1ezdo+XlvurOEiHIwpRjt7XOh+uobHkYIzYrzZixXhFfatXMDCzT821RU40OJ
         GhqHsuh7oh/3Wq5n0gltOLMIM+nSrkAvVb0wl07qcYnnrOAhh7PQE38X2L4+1dA7m46k
         qGbxPb22HISft0Nxdhy/R2pFj+I1nHsr4ljjc1Xrj8u8NxJFUa+05eYSmGWK3SkKu6Dj
         53rn12tKKnl2hKYG2b/eX3EbrYQbc8lsC1199G4tlJIyzxUiFrEYS3k4Yk/E63cf65oe
         y8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ELSjbPI242d4A9Dvrq1gpvvqgp04MYX2PuvwmepyYl8=;
        b=WTgJVKOJl63cwJ7KvHhO9nNTczv08EnJmNDA1Po6jAjRIDGCewo02U3edJGw1YZV0G
         h6v+dRbQgj+mrdKOV4S/THR8eFMScBb3OOixb0iF2Lsmy7Wg7WMCb0MAAF453hv2Zlwz
         IYBpZnCIfiasjVlsQY7MkaJG2wcm2an0zPC1wlVHF/cz9+yEvGv3kJsLy1yJxjcVDqVS
         KKCetPQYOkj1KCvHp+ugyBEiInWt7ASjBHx8R7pMubvRLURkNmQQhyjpzr0Ut7rAVjK1
         LSTXlnrsSaLzwkCGPsk/yJiqntWTT7S+8Lno+AG2ArKW0mC0hX08uHe+58TwcDoinJAa
         h41Q==
X-Gm-Message-State: AOAM531/DEGP9Nm7H+oDDYO1perTDh/eKcEynmW+mjGIjeiqpJY/zNVd
	3yqivzqPcJ0CUadb/I/xdbGrARITys4j21znZvcJQNSuGqM=
X-Google-Smtp-Source: ABdhPJxQ4LrcujKJUyVfGUFGNKdYcctb1uppsi3muxrXcHqpgBxJgiFcZXJ5py+aAN7Zw0NqRMUugaShilVP2tox97k=
X-Received: by 2002:a05:6000:91:b0:217:8efc:f572 with SMTP id
 m17-20020a056000009100b002178efcf572mr20520076wrx.186.1654715902322; Wed, 08
 Jun 2022 12:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <1593fdf40a6046a7a614407f7d08be15@ztsystems.com> <68063aedd81c42b39d1b343e3a0748b5@ztsystems.com>
In-Reply-To: <68063aedd81c42b39d1b343e3a0748b5@ztsystems.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 8 Jun 2022 12:18:10 -0700
Message-ID: <CAH2-KxDSO6UUm0k-cdEQnTdqd=_-Hw9eCuysCzrRpRvdJ=eoZw@mail.gmail.com>
Subject: Re: FW: Newbie question on Redfish URI resource names
To: Jeff Friedman <jeff.friedman@ztsystems.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 8, 2022 at 11:10 AM Jeff Friedman
<jeff.friedman@ztsystems.com> wrote:
>
> Hello all,
>
>
>
> New to OpenBMC, and am not clear on one thing as pertaining to the Redfis=
h schema and URI resource names:
>
>
>
> The DMTF Redfish schema URIs are defined as:
>
>
>
> /redfish/v1/Chassis/{ChassisId}/
>
> /redfish/v1/Managers/{ManagerId}
>
> /redfish/v1/Systems/{ComputerSystemId}
>
>
>
> Vendors can use their own names for {ChassisId}, {ManagerId}, and {Comput=
erSystemId} as long as they conform to the syntax rules.
>
>
>
> Question: Does OpenBMC specify names for these resources as part of the O=
penBMC spec? Or does OpenBMC just refer to the existing DMTF Redfish schema=
s?

OpenBMC does not specify nor guarantee these names, which is in line
with the Redfish specification.  The spec essentially states that
odata.id is for walking the Redfish tree, and nothing else.  If you
want to get a single object, you need to rely on $filter (either
locally or on the client side).

>
>
>
> I ask because I have seen reference to the following names in examples fo=
r Managers and Systems on the OpenBMC website:
>
>
>
> /redfish/v1/Chassis/{ChassisId}/
>
> /redfish/v1/Managers/bmc/
>
> /redfish/v1/Systems/system/

The hardcoded ids of "bmc" and "system" are things we're actively
trying to fix, because we need to support systems with more than one
management controller, and more than one ComputerSystem resource.
Most of the discussion has happened in code reviews (on gerrit) and in
discord in the #bmcweb-and-redfish channel.  You might check those out
for more up to the minute information on what the plan is here, but
the TL; DR is that those IDs need to change, as the redfish spec
allows us to do.

>
>
>
> In summary, does OpenBMC specify these resource names as part of their sp=
ec, or does it refer to existing DMTF Redfish schema specs?

Kinda the later, the the Redfish specs say that this is an opaque
field, and the client should not be using it for resource
identification if you want to be compatible with more than just one
system, which ideally every client should at least try to do (please
don't hardcode openbmc-specific assumptions in your redfish client).

-Ed

>
>
>
> Thank you!
>
>
>
> Jeff Friedman
> Sr. Field Systems Engineer | ZT Systems
>
> M: 206.819.2824
>
>
>
> This email and any files transmitted with it are privileged/confidential =
and intended solely for the use of the individual to whom they are addresse=
d. If you have received this email in error, you are not authorized to dist=
ribute it in whole or in part. This communication does not constitute a con=
tract offer, amendment, or acceptance of a contract offer, unless explicitl=
y stated.
>
>
