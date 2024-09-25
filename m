Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E3F9851F2
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2024 06:17:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XD3NC5sJcz3c58
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2024 14:17:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727237831;
	cv=none; b=ZID/h48oVJgqzwsMfY/E5Wc3V2Q2u4sZFvSL3EILoBrkCjQX1as+AvFENG71iTS7bB+vu1ivv8NXabbsZQnuV2Ntg8ew5rFAfhy3Ck4DYjL67gyTlfsWZU+qMu6lQswuOB14dZJz+xe4iDzJT7e7T+Egrev4rVZnNrcUhwQGbdCxFCXQSPP85R4yf7O4ZETwQaiiBLYYdpZjebdSffQpn/Qu9sMV+K+zIhDvkZOUQe8U60AymCk3IJzrBKHxXUIvAMTxOXm0pUQvQxtsI6kaOgHD054oIEBa3hhULuRWUwWdrZMlsCltb9BtUYUZb7GLswBoshPsDbQWBEFXQGktYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727237831; c=relaxed/relaxed;
	bh=3QnC1DiR1cl2DuuwxCo/TfvfT4koLiFgbH0Py2ePfcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MC//ul5+niZHMkcNvkw/R+7WElEh+S0QABYf45KlS86uIY43Y0inA2lOfNZCujPGjBxC1Q3r1e6id539rU0et7Q0tNPFzESd/RJ0NLDYfoNKlJA88iSZX5VhsnPUcuxILXfvdapDVNNKSvEe/WMwJX4cnk3+E5cmV66ETjTd3JeRCaIpvifCJSdk0W6hyNsvDtQ6rLyEPO0K3ePYGMLc6i9HcQOmNG5HLV0tB6U62liaZeDGJB5+t1vRPIWNYBmybdRp1N1+X8HJHUvEzgRMk6Sax7OqcsNooDWHBLv1cvm8hFD8hJ2YfBxLMGfJh34hwodECrxG21tbE7/drfDeCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cLqMFTnp; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cLqMFTnp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XD3N66WC2z2xjH
	for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2024 14:17:09 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5365cc68efaso2009375e87.1
        for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2024 21:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727237823; x=1727842623; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QnC1DiR1cl2DuuwxCo/TfvfT4koLiFgbH0Py2ePfcQ=;
        b=cLqMFTnp2pgr9LKdak3GwmIaopwznHkjnArihacXynGwxSDOiwvej77fbjGaqN5tml
         EpHS0x9U77i/JxCa/QzkXA1nwCTvlu5zm20rKXSvOPV3y18tHJ17gumVTS8TjF64vsqg
         0wsE/fxjEpv0T6gmvZST8RIY46N7JI40hhvFbjGj8tIrudas93v4GgmPIbIdxIE5CNJq
         moyBTVYM918RF2xQuFVZje0yWfIn7HXm44FlmkfD1KAMa1Kb9TGzlJMVUia+LkAJOwVk
         Kg4GpbKBCslHnaskGpYmptClLuSxZQyhxRtexKW5ADWSZKKVbiYSWWZQa6bOgKdPjWMK
         pu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727237823; x=1727842623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3QnC1DiR1cl2DuuwxCo/TfvfT4koLiFgbH0Py2ePfcQ=;
        b=dXmM9UnJa/W2KReVMuBApstLp1nT1Cijn7j0g9k/Va+DKDJkY4ywXiUaAUEY+Mrw0h
         q5w/csXTkY4LPtjYY5W+lTM+P+VZkkhTE3Ox/2NAsWklpFkSQR6VCaNy31lmc52gmeH+
         ZpCipAv8Tdjm8xtfmlkwy0E+tRAVTB8of++m75+SxwsIzCR4aleOZdL3rsEJLnLbyPw6
         3BRM36hEE/MAIlDxyOh2diZvM+vxnfPyCY58JsBJ1qTzHCHOq8745aObPwKwZ/+p9ayb
         dH0TluwnVzdo0DujLA0TVY3n7/Csl1qoyEgk4BPvBP4kvk+N/817VhIvIOACbklVWbpp
         /wNg==
X-Gm-Message-State: AOJu0YzKKk60j+0DBPWhGmDPI1s3IqRI+vx1crl9q4O3iHwajsvq7+qq
	tYePPvvyFbFFmeP0z9DYVQyQKIILAFtSqO8ixHd2J1HG3Xe0lgNz56AYTz3KyNn2Mat8rRxquvB
	WhXg+0Zl7ansdnh9mvejX1jrp3AI=
X-Google-Smtp-Source: AGHT+IFaZNtjh4Kj1Eyr3O5d4v5iGSUcwry1BYm5vyKqyoZd9cO/cbUCubFWZFIwl31tJnzcBtCzlQB/VQQE0AGDxk8=
X-Received: by 2002:a05:6512:32c6:b0:52c:e3bd:c708 with SMTP id
 2adb3069b0e04-5387048bca4mr600901e87.10.1727237822894; Tue, 24 Sep 2024
 21:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240925004643.1298510-1-potin.lai.pt@gmail.com> <01d01f82826546656898a919430f3de3ae28e040.camel@codeconstruct.com.au>
In-Reply-To: <01d01f82826546656898a919430f3de3ae28e040.camel@codeconstruct.com.au>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Wed, 25 Sep 2024 12:16:51 +0800
Message-ID: <CAGfYmwUonWZo-o8j8fV0r54_HzsCEHB67Eca_wuhpSuzAnv8RA@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.6 1/1] rtc: nuvoton: Compatible with
 NCT3015Y-R and NCT3018Y-R
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 25, 2024 at 9:50=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Wed, 2024-09-25 at 08:46 +0800, Potin Lai wrote:
> > From: Mia Lin <mimi05633@gmail.com>
> >
> > The NCT3015Y-R and NCT3018Y-R use the same datasheet
> >     but have different topologies as follows.
> > - Topology (Only 1st i2c can set TWO bit and HF bit)
> >   In NCT3015Y-R,
> >     rtc 1st i2c is connected to a host CPU
> >     rtc 2nd i2c is connected to a BMC
> >   In NCT3018Y-R,
> >     rtc 1st i2c is connected to a BMC
> >     rtc 2nd i2c is connected to a host CPU
> > In order to be compatible with NCT3015Y-R and NCT3018Y-R,
> > - In probe,
> >   If part number is NCT3018Y-R, only set HF bit to 24-Hour format.
> >   Else, do nothing
> > - In set_time,
> >   If part number is NCT3018Y-R && TWO bit is 0,
> >      change TWO bit to 1, and restore TWO bit after updating time.
> >
> > Signed-off-by: Mia Lin <mimi05633@gmail.com>
> > ---
> >  drivers/rtc/rtc-nct3018y.c | 52 +++++++++++++++++++++++++++++++++-----
> >  1 file changed, 46 insertions(+), 6 deletions(-)
>
> So I looked at the history of this driver upstream, and it appears that
> this is (approximately) a backport of an existing change:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D14688f1a91e1f37bc6bf50ff5241e857f24338e0
>
> In the future, can you please provide such a link in the patch notes
> (i.e. here, below the `---` above but before the diff markers below).
>
Yes, this is a backport patch.
Thank you for the notice, I will include the link in future.

> I compared what you've sent here and the patch above:
>
> ```
> 0 andrew@heihei:~/src/kernel.org/linux/openbmc ((c58d8005433d...)) $ git =
diff 14688f1a91e1f37bc6bf50ff5241e857f24338e0 HEAD -- drivers/rtc/rtc-nct30=
18y.c
> diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
> index f488a189a465..076d8b99f913 100644
> --- a/drivers/rtc/rtc-nct3018y.c
> +++ b/drivers/rtc/rtc-nct3018y.c
> @@ -102,6 +102,8 @@ static int nct3018y_get_alarm_mode(struct i2c_client =
*client, unsigned char *ala
>                 if (flags < 0)
>                         return flags;
>                 *alarm_enable =3D flags & NCT3018Y_BIT_AIE;
> +               dev_dbg(&client->dev, "%s:alarm_enable:%x\n", __func__, *=
alarm_enable);
> +
>         }
>
>         if (alarm_flag) {
> @@ -110,11 +112,9 @@ static int nct3018y_get_alarm_mode(struct i2c_client=
 *client, unsigned char *ala
>                 if (flags < 0)
>                         return flags;
>                 *alarm_flag =3D flags & NCT3018Y_BIT_AF;
> +               dev_dbg(&client->dev, "%s:alarm_flag:%x\n", __func__, *al=
arm_flag);
>         }
>
> -       dev_dbg(&client->dev, "%s:alarm_enable:%x alarm_flag:%x\n",
> -               __func__, *alarm_enable, *alarm_flag);
> -
>         return 0;
>  }
> ```
>
> Given the hunks are fairly benign I've instead directly backported the
> upstream change.
>
> If you have any issues with this, please let me know.
No issue from me, thank you for the quick response and support.

Potin

>
> Andrew
