Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA31C54C1F1
	for <lists+openbmc@lfdr.de>; Wed, 15 Jun 2022 08:33:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNFr94r7cz3brM
	for <lists+openbmc@lfdr.de>; Wed, 15 Jun 2022 16:33:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AGadl48x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AGadl48x;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNFql3sCtz3blJ
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2022 16:33:22 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id h5so14005793wrb.0
        for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2022 23:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eGm819DCk8emq0E7POY6NJJgdz/Qvncf2+cCQB3D3KM=;
        b=AGadl48xzLBBMMV8lz+SwOY088aO91nzR+xLjHM+X07e9Km70nadkyLEFkANXILhz1
         iF+vDj57klcIAM0BhOMPxM9SsMdufaXZVNCKcYhdq4ornme7xfb98erQo824QJbH9C1k
         Wt+3UJfdgeJ4hLwK3xTO5qzROTjbueu44EQj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eGm819DCk8emq0E7POY6NJJgdz/Qvncf2+cCQB3D3KM=;
        b=q0AtpKTva1SEhhcyjimHBoM16Toybtve914+IEcenSKNV6Jg7Q6z9QNRL62+SA2NMv
         niSFyCXmrg4X4ZF0cpZSeueyYOl4UdW3rNYn57rGuMw1qIP668gPqQjbmjADkts//XdJ
         FTRMcS45iTWCBl/Hg1tipGXMUiqtf3Cn0CR6+lA2UEY3WN7Sd30mnCVRvUX5sWC7JfBX
         8QTndl70QtLI3wDKI9OlydGIhC98csELcGApeZRes7YDs2L/wg80tFDqJ34QxUNZe0jO
         oM+0nziZJKA1eBmCVOyQj/+mZt8hob1jNwzaXxmUaFWsBfPwy7Uh5WJ5mVy0lYREmUmH
         jrdA==
X-Gm-Message-State: AJIora8cAWH1GfXn7BFNpQwMKkhHdxtYHF/lYLuOFRsPfrHr85FDeRn2
	7IW/K2kl/ujZ3kCoj4jJgPMAKn/wknSSp4H4XTI=
X-Google-Smtp-Source: AGRyM1uCD9wieO5YfkX9WJn6veh/nR9XFbG+XAoD4R5z5QxIVGyiU+gR7QXhA6NnxHVFrmd034xrzlYQh9mf5O+5NN4=
X-Received: by 2002:a5d:428f:0:b0:210:30cd:3753 with SMTP id
 k15-20020a5d428f000000b0021030cd3753mr8059134wrq.549.1655274798512; Tue, 14
 Jun 2022 23:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220610080059.2333501-1-joel@jms.id.au> <20220610080059.2333501-5-joel@jms.id.au>
 <6c3afc64-f046-6708-1248-980202cedff1@kaod.org> <CACPK8Xfpcn7p55ygtszEwbOzGRxMjX3cOzQgwJhgout5gd3pGA@mail.gmail.com>
 <54d6cbaa-33f2-e9a0-f7c4-0f99681e7d59@kaod.org>
In-Reply-To: <54d6cbaa-33f2-e9a0-f7c4-0f99681e7d59@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 15 Jun 2022 06:33:06 +0000
Message-ID: <CACPK8XenBTSWE=XHif+DR7=sKY16NsDOJ6FAD-T-h76ToB0ipA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 4/4] config: aspeed: Enable
 NCSI support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jun 2022 at 06:00, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 6/15/22 07:58, Joel Stanley wrote:
> > On Fri, 10 Jun 2022 at 09:31, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> >>
> >> On 6/10/22 10:00, Joel Stanley wrote:
> >>> Now that NCSI can be enabled without breaking non-NCSI systems, enabl=
e
> >>> it in all defconfigs.
> >>>
> >>> Signed-off-by: Joel Stanley <joel@jms.id.au>
> >>
> >> You should add :
> >>
> >> CONFIG_CMD_NCSI=3Dy
> >
> > Was this required, or just something that helps for testing?
>
> It helped for 'ping' if I remember well. Without it, it didn't
> work (on QEMU).

I see why. In net/net.c:

#if defined(CONFIG_CMD_NCSI)
                case NCSI:
                        ncsi_probe_packages();
                        break;
#endif

If CMD_NCSI is not enabled we never get a chance to probe the packages
(unless a NCSI packet happens to be received).

I think we should do this, so it works without the command, but I'm
not sure if it's the correct fix:

--- a/net/net.c
+++ b/net/net.c
@@ -539,7 +539,7 @@ restart:
                        wol_start();
                        break;
 #endif
-#if defined(CONFIG_CMD_NCSI)
+#if defined(CONFIG_PHY_NCSI)
                case NCSI:
                        ncsi_probe_packages();


FWIW, the intent was that ncsi would work without the command:

https://lore.kernel.org/u-boot/6f2bd3960efd895eb2660fcf02053f14f8d6a386.cam=
el@mendozajonas.com/


>
> Thanks,
>
> C.
