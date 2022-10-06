Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A67475F62E2
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 10:38:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjlFr2XDWz3c6t
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 19:38:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=GVGS7BPD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=GVGS7BPD;
	dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjlFH60trz2xVr
	for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2022 19:37:54 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id j16so1559616wrh.5
        for <openbmc@lists.ozlabs.org>; Thu, 06 Oct 2022 01:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=Oyp8a7gYttyk9yqG8gurRvmwZmgd02RBL0mXOJ9mGKY=;
        b=GVGS7BPDf0xCQhr1wmZalLEfcNl/floVlfyvEDauKdacXBbd58I9Q8OifMUMkXWcGD
         zGOsYnwVApUx6vlV8kUsm6xQ1pVlUcpxR+9v63pz9uwsrx5pkIjtiXYvlM1nmyov4jk5
         DCqVnwsSKrW2Mx32owkf/Fa4BB4aBsetbLg7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Oyp8a7gYttyk9yqG8gurRvmwZmgd02RBL0mXOJ9mGKY=;
        b=YbEKq2NO/VJKIuuV0uDlDEwK72eN6kq0xRO6R+5zhesNLA8quxPtvj18GAXtm+DvfI
         KY/SIz9UV6wZGQF828Pf1iqOGI8dSgv33A6BM3hcYqfifFeWsNwkpRZjwNM8zXbhIVkg
         fhPB6EnopJKeHeSQqRqTm8HgP49EicIjh5j5XH/RJOFS7ts1X8zXg/WOvh/1T9yJQ3Ob
         sOVugbhH/TqNcLvS04zYH2MKj/Sx7VWyw8piAUrzrNRKxdhRcThVSDoLfhLjaF86lhq0
         vTuNnav34S66JItDrIoo5EtzGdfiRZk9kajON0zIFvWVWPhiDwEqPuXLOm1S4sg77zXH
         cr9w==
X-Gm-Message-State: ACrzQf3jQ9ygRYCaRPklMs1d9S2uYzdF0lgB1AZO5caFxLMYxWyorQV2
	uifolSBqAnFerMOp1BcUd3sYtJ1+HpzPFDdTV71RrbZCDLs=
X-Google-Smtp-Source: AMsMyM7mMgjYYYpsX7J02YlvMvCfgaRb17hdyJJjc0ugNJ8P6y91w+3RKH2sQd5JAheUuj3Fgt7rc97aVyokDc5mub8=
X-Received: by 2002:a5d:490f:0:b0:22e:4bae:c06d with SMTP id
 x15-20020a5d490f000000b0022e4baec06dmr2230718wrq.549.1665045470304; Thu, 06
 Oct 2022 01:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XdERea0Mt+3o1z2TwbN_NXJ-FDYf8mxUEAWe5Lp7oFRmg@mail.gmail.com>
 <CACPK8XfrECvJtwZ8AR1EgsVHpSnkKCVp2LovCXCyFXBpjeBbfQ@mail.gmail.com> <27257597-8068-ab59-ec5d-99deb66065e2@os.amperecomputing.com>
In-Reply-To: <27257597-8068-ab59-ec5d-99deb66065e2@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Oct 2022 08:37:38 +0000
Message-ID: <CACPK8XeOV71erRYS9YkkKJqjUnAPTucC4t1Ltfke6+jkVTrmvA@mail.gmail.com>
Subject: Re: Linux kernel updates and v6.0
To: Quan Nguyen <quan@os.amperecomputing.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 6 Oct 2022 at 07:04, Quan Nguyen <quan@os.amperecomputing.com> wrot=
e:
>
>
> >
> >> Please address any future patches to the dev-6.0 tree.
> >
> > If you have pending patches then please let me know that you want them
> > merged to the dev-6.0 branch. Otherwise, rebase and re-send them to
> > the list.
> >
>
> Hi Joel,
>
> Could you help to pick this patchset to the dev-6.0 branch ?
>
> https://lore.kernel.org/lkml/20221004093106.1653317-4-quan@os.amperecompu=
ting.com/

I merged this but it caused a build error:

drivers/char/ipmi/ssif_bmc.c:864:27: error: initialization of =E2=80=98int
(*)(struct i2c_client *)=E2=80=99 from incompatible pointer type =E2=80=98v=
oid
(*)(struct i2c_client *)=E2=80=99 [-Werror=3Dincompatible-pointer-types]
  864 |         .remove         =3D ssif_bmc_remove,
      |                           ^~~~~~~~~~~~~~~

I think in 6.1 the i2c drivers will return void in their remove
callbacks, but before then they still need to return an int. I have
updated your change with this patch:

--- a/drivers/char/ipmi/ssif_bmc.c
+++ b/drivers/char/ipmi/ssif_bmc.c
@@ -835,12 +835,14 @@ static int ssif_bmc_probe(struct i2c_client
*client, const struct i2c_device_id
        return ret;
 }

-static void ssif_bmc_remove(struct i2c_client *client)
+static int ssif_bmc_remove(struct i2c_client *client)
 {
        struct ssif_bmc_ctx *ssif_bmc =3D i2c_get_clientdata(client);

        i2c_slave_unregister(client);
        misc_deregister(&ssif_bmc->miscdev);
+
+       return 0;
 }

Cheers,

Joel
