Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 138DC9850B9
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2024 03:51:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XD07N2Ljnz3by2
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2024 11:50:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727229052;
	cv=none; b=KpdcxTuGyzBNRYT/Xes8CWkWPQVDEaeXdCzZclUgWgtHrft45j5nRjqlKbJEuJU9vlfC+LcGbWG5I4gIBOyP2NwtcX1wRMSteh4y97gK2pOqwdzkr9R0rkIEC0swA9gBswN+ArOOXOr5ZTVdW6gKVZV/E7IjTqY4wLbcWQtEi0KA4qrTR5u0P+GqzshUm/O7N4k+bSvgtrxZDW3/Tnu9OPYIwCKnd3wO82/iCmG51lgYseViBT59AJtnreKHs3S5p+7T/Izljqlqj9R8EpyA5sB9+gjwUPneyuXiOnfeHrdqJ3tYeSrlLhF+BzGhaGp9S4DJj04SKb8vIoh6QBaYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727229052; c=relaxed/relaxed;
	bh=PlY5EosJsb+Rptq5chbvMifdGSYpBgyh3OnjhsCbPCA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iJjl0iz+Tk/ziUSXbm76+OzWQ818v6PkgOIIsof9zoU2I3DaaOoJFYHo/61drD3ozudM0bPYnOcafC/7F6HK4nhhYMn/AU6x0xXk9cRWzt9h6QmsGJRUnH5UaJZcoqVg9it4ECmvkIWP05LlIwisCKxOvQl20UwlZy3jYR/5kwax/dyiiijFeevN4LAxMs3hl42XMkdpq7H4UdxjnxT0Fc8Ykp4Qg23jMH2hDiNgfGT+oI9wR4N29heVQX558aLgN21mliLgoiwo3GowW70+dcDXgZxdwxkzPdcoaJjKVrDD6g4IE5RaMmPrg+NiZ2Uhp6Vf4/6PdUpP6XbGY4hvtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lpAuu86O; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lpAuu86O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XD07J4Vncz2yGD
	for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2024 11:50:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727229049;
	bh=PlY5EosJsb+Rptq5chbvMifdGSYpBgyh3OnjhsCbPCA=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=lpAuu86OckHNDdZPTsvMmALeD+BiHmQ4RvA2879KafyHSIp1kKYlC+5Nm1WKCj+lf
	 6LuLX5uoDQg+Fg/7+2QiwMbIKD10PgnkzUcHnSvRKOCiZyrEwW06f4LpaRb9aEpNZA
	 cWTpClJpJyen0ZPHqsWHV7YrAueeP4Tj1E0On+jAwDa4FTZO4orVov4dWCREvG8wlv
	 bbfIoTJQCwZ+EiAqQC5/N2v53BncopuZqYH3QNtArKW93i28iz6jImXBaWY1aexA+T
	 6iZcIxT3OKm/WLyuwMXnV6HCmiT9U2M5n+64EgTckNx6JF7lqxFGU66zaWU1GDm+fS
	 cTHJkSaGMhJIg==
Received: from [192.168.68.112] (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2470464C85;
	Wed, 25 Sep 2024 09:50:48 +0800 (AWST)
Message-ID: <01d01f82826546656898a919430f3de3ae28e040.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 1/1] rtc: nuvoton: Compatible with
 NCT3015Y-R and NCT3018Y-R
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, openbmc@lists.ozlabs.org, Joel
 Stanley <joel@jms.id.au>
Date: Wed, 25 Sep 2024 11:20:46 +0930
In-Reply-To: <20240925004643.1298510-1-potin.lai.pt@gmail.com>
References: <20240925004643.1298510-1-potin.lai.pt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2024-09-25 at 08:46 +0800, Potin Lai wrote:
> From: Mia Lin <mimi05633@gmail.com>
>=20
> The NCT3015Y-R and NCT3018Y-R use the same datasheet
>     but have different topologies as follows.
> - Topology (Only 1st i2c can set TWO bit and HF bit)
>   In NCT3015Y-R,
>     rtc 1st i2c is connected to a host CPU
>     rtc 2nd i2c is connected to a BMC
>   In NCT3018Y-R,
>     rtc 1st i2c is connected to a BMC
>     rtc 2nd i2c is connected to a host CPU
> In order to be compatible with NCT3015Y-R and NCT3018Y-R,
> - In probe,
>   If part number is NCT3018Y-R, only set HF bit to 24-Hour format.
>   Else, do nothing
> - In set_time,
>   If part number is NCT3018Y-R && TWO bit is 0,
>      change TWO bit to 1, and restore TWO bit after updating time.
>=20
> Signed-off-by: Mia Lin <mimi05633@gmail.com>
> ---
>  drivers/rtc/rtc-nct3018y.c | 52 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 46 insertions(+), 6 deletions(-)

So I looked at the history of this driver upstream, and it appears that
this is (approximately) a backport of an existing change:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D14688f1a91e1f37bc6bf50ff5241e857f24338e0

In the future, can you please provide such a link in the patch notes
(i.e. here, below the `---` above but before the diff markers below).

I compared what you've sent here and the patch above:

```
0 andrew@heihei:~/src/kernel.org/linux/openbmc ((c58d8005433d...)) $ git di=
ff 14688f1a91e1f37bc6bf50ff5241e857f24338e0 HEAD -- drivers/rtc/rtc-nct3018=
y.c
diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index f488a189a465..076d8b99f913 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -102,6 +102,8 @@ static int nct3018y_get_alarm_mode(struct i2c_client *c=
lient, unsigned char *ala
                if (flags < 0)
                        return flags;
                *alarm_enable =3D flags & NCT3018Y_BIT_AIE;
+               dev_dbg(&client->dev, "%s:alarm_enable:%x\n", __func__, *al=
arm_enable);
+
        }

        if (alarm_flag) {
@@ -110,11 +112,9 @@ static int nct3018y_get_alarm_mode(struct i2c_client *=
client, unsigned char *ala
                if (flags < 0)
                        return flags;
                *alarm_flag =3D flags & NCT3018Y_BIT_AF;
+               dev_dbg(&client->dev, "%s:alarm_flag:%x\n", __func__, *alar=
m_flag);
        }

-       dev_dbg(&client->dev, "%s:alarm_enable:%x alarm_flag:%x\n",
-               __func__, *alarm_enable, *alarm_flag);
-
        return 0;
 }
```

Given the hunks are fairly benign I've instead directly backported the
upstream change.

If you have any issues with this, please let me know.

Andrew
