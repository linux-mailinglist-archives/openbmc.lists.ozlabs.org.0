Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF146FC4F9
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 13:26:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFwq52THsz3bcT
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 21:26:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Y2GlFiPK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Y2GlFiPK;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFwpV2p7Tz309V
	for <openbmc@lists.ozlabs.org>; Tue,  9 May 2023 21:26:25 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f22908a082so3434683e87.1
        for <openbmc@lists.ozlabs.org>; Tue, 09 May 2023 04:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683631579; x=1686223579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j1Lkm0KXYokD+OLY+F3IcMnO6un4JH/G8XI26Ja3x6E=;
        b=Y2GlFiPKnDGWZ80IemegPJgklmdJFDsz1u4l7BSx6DCr/ZWWi19nGRQwR0oW8cWPnq
         8/Q0kdbA1e7rWKKzHkihon4c717c0jw9RTOr0WQXv53e/uQqUqfYGIo7q22mOZOFNbjq
         ox4taTTpsHnokcqgIN588+Z+ksNiQq2G3gA+g334PTwaSNrRs/0NgeTVkE5T0qVrqom5
         ltRiwQ5AV+dA0vOAgyI4wCH2gSOrAVNZHcin+QcCZVqDDvTv5LiQKgmC0LM+gn57yhzG
         xk+BR7VneBpMoNL2+6kGv8LGsbIDpQlKpmQc8fXgogq80M4pGiBEhAr3boFOHqxnbm4T
         Kl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683631579; x=1686223579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1Lkm0KXYokD+OLY+F3IcMnO6un4JH/G8XI26Ja3x6E=;
        b=BEchLFu/ZXpQvDcssaCc8MLMhVK5oaexSbUzEf2R5GYq5pKECcKesQC19PKzrH7P8p
         9Y4A6+di9mQ/PQ3LGWIPwz9cBp506YBoX8VL5NXkmbGZ5n07+vvte62L4CaexOpKoPhK
         j/ut/xNIPbTA6zlMjh97lQY1lyj4Gqrey/KAqiEQZBX3illc/iOUqbfjJtCNJGOIZfUS
         EiZDSREYb0Hddpx7JLB+wPgkngYNSUeLKjvwlUUk2E90EJiuY/HuHqCsB5zOpSCvlQ1F
         CMl2NUbMmOIe9PFxrqtV67XmmxcnlirpPzaWBEGI7fpgO5Nb0g5cGM1L7X5kJyPeEXHJ
         Socg==
X-Gm-Message-State: AC+VfDxqj9V8rgXDyKAhap+RCQyOTfLrkjdm5Iq2EOiJ71x1NNv4YhVf
	3sakQs6ku3wRBy5+5MKZ4KE=
X-Google-Smtp-Source: ACHHUZ6/+Ap+7q6zFxP+ctIxmPgGkTYOUORN3G+JSoZKfa6VeikfsZfYdH50HbUKo6rDa6PyyfHmww==
X-Received: by 2002:a19:7403:0:b0:4ef:ff42:b13 with SMTP id v3-20020a197403000000b004efff420b13mr632960lfe.65.1683631578620;
        Tue, 09 May 2023 04:26:18 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id 5-20020ac24825000000b004f20d0ebe50sm318619lft.94.2023.05.09.04.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 04:26:18 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 349BQDFa031208;
	Tue, 9 May 2023 14:26:14 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 349BQCTd031207;
	Tue, 9 May 2023 14:26:12 +0300
Date: Tue, 9 May 2023 14:26:12 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: Hot-plugging non-sensor devices on non-PnP buses (was: Re:
 entity-manager: SBTSI and hwmontempsensor)
Message-ID: <ZFot1Pdx02sTVFux@home.paul.comp>
References: <CABoTLcQNTwxi5nVRG8yRoDrrtV-pO-WA1ubtFVmnLnebPLucmg@mail.gmail.com>
 <9b2c7872-fbe3-4691-b5c1-bf69290b4186@hatter.bewilderbeest.net>
 <ZFTK+ij4jMAqtQWw@home.paul.comp>
 <17542652-2f18-4bd0-9432-f81ebc4c5f42@hatter.bewilderbeest.net>
 <ZFn46vES/XAKOtuF@home.paul.comp>
 <93fcd898-7eef-4855-b93d-cd34bf7dd758@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93fcd898-7eef-4855-b93d-cd34bf7dd758@hatter.bewilderbeest.net>
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
Cc: Ed Tanous <edtanous@google.com>, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ali El-Haj-Mahmoud <aaelhaj@google.com>, Oskar Senft <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 09, 2023 at 03:35:09AM -0700, Zev Weiss wrote:
> On Tue, May 09, 2023 at 12:40:26AM PDT, Paul Fertser wrote:
> > In this specific case we tested having the driver
> > built-in, it tries binding on BMC startup, fails if the host is off,
> > then at any point of time one can do "echo 5-0019 >
> > /sys/bus/i2c/drivers/leds-pca955x/bind" and it'll re-try binding, and
> > that works if the host is on at the moment. And of course it can be
> > "unbind" later if needed. This could even almost work with current
> > entity-manager code if it was listening for host power state events,
> > if it wasn't skipping the devices that it already tried exporting, and
> > if it had something like $HexAddress for the template arguments.
> > 
> 
> Perhaps that's something worth experimenting with and posting E-M patches
> for?

I tried toying with the idea despite entity-manager code giving me
head spinning (especially after seeing how 9b86787adea3f added even
more asynchronicity without any obvious way to pass the end result of
the "exporting" back to the upper layers, and with D-Bus objects
getting added irregardless of exporting failures etc), so that
reasoning about all the possible race conditions feels beyond my
abilities) and also that current code seems to be written under
assumption either it retries the whole board or none of it
(deriveNewConfiguration() tracks only top-level objects); the news
that the functionality is moving to other daemons made me think that
it's probably not worth persuing, and that I certainly need some
feedback from the E-M maintainers to avoid wasting even more time on
this.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
