Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 410AA4B3118
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 23:56:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwTWf6wHfz3bcB
	for <lists+openbmc@lfdr.de>; Sat, 12 Feb 2022 09:56:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=doxLCLfn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2d;
 helo=mail-io1-xd2d.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=doxLCLfn; dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwTWD2YnPz30R0
 for <openbmc@lists.ozlabs.org>; Sat, 12 Feb 2022 09:56:23 +1100 (AEDT)
Received: by mail-io1-xd2d.google.com with SMTP id q204so13177885iod.8
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 14:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=aQThvyHrmHYJKmyEmQTRnAAe8LxCAZTx/wHXwO3n8Uc=;
 b=doxLCLfnbx40R0b03wv5146FSM03JEm9xynFcARFeFYIqwY8V2X1TNw61carEvKvcq
 VT0jyaefdTdSxw6dtEvJre6dGkQ1Yo1OrnSIBF0J1LUQ4NFhHcBOQGruVIMA/QxFAkJ1
 H+YTXjP+ONpYhPBPKB+QnqkhoGJdGBiTgAC2GVAqjo6pl2EcCsLbrQdWi8CPKKZCO5Xe
 QfuhO4qXAxoh8kbk6ZeRNrOm5TfN9vW8/6v96WZBYtUOtmBrFoRp3dhNoqqOwDN9FHOD
 b6ESvkqKuykwq30r5qYp2j5fPw3lfUaVmi5D4OaBgJntYDnjI9sr6re+OdfqHTntNxa+
 kcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=aQThvyHrmHYJKmyEmQTRnAAe8LxCAZTx/wHXwO3n8Uc=;
 b=zxgmQuahURjJ/gC78qndqBXZAFRxe0o4swbaRT9XaR5osrb5uRpSH9LH6PgC1fjEhl
 Em3Si0kffFr0/3HvG1APy4nViWORq3WzMy6tz7nY6va1Zo2YCq7jtpr+SMU/Cwflathw
 yHZqn0ColXZjGhc4rktH5esrFLOo5Aw4QgYHJM373hc2upLFsqZwajG007JiuaPmfZsy
 jF8Hc/w6sx3OfQotR9KmVlY1jebjuro9Rmlb4kkibN+7HRv7g5VcAZYWpW1qFA+HYrVX
 sqvrqg4yvZT7XORxGSGEFbZYP/QeWZU4HxJrhX7JfOs/WY9n8n3EArzRSLLoED/iJ0HI
 KTzw==
X-Gm-Message-State: AOAM532gkpg0+aZyGZbZJiMB6uZYpinAPtnarcaOOfLccxUMCRq6gQ3B
 XnBYNIb9pkm8CQtDa7uI5wU=
X-Google-Smtp-Source: ABdhPJw0XaIX+PhCNrfrPvmVxvu2ljVxyXK7ubpizjUNQ7c9KqASV3l28riuzQs9FYr7bPrvnEH8rg==
X-Received: by 2002:a05:6638:1454:: with SMTP id
 l20mr2115441jad.22.1644620179957; 
 Fri, 11 Feb 2022 14:56:19 -0800 (PST)
Received: from smtpclient.apple ([2601:281:c000:e8c:d0ca:f309:80a0:46f0])
 by smtp.gmail.com with ESMTPSA id d11sm14155822ioc.49.2022.02.11.14.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 14:56:19 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: No dbus objects for phosphor-regulators
Date: Fri, 11 Feb 2022 15:56:18 -0700
Message-Id: <875224D5-837F-4538-8128-F5F45808B689@gmail.com>
References: <CAH2-KxCOOqoXmBLmR+=Jjrea1fouCOYOb4pGwZHwk5c=QJHeJg@mail.gmail.com>
In-Reply-To: <CAH2-KxCOOqoXmBLmR+=Jjrea1fouCOYOb4pGwZHwk5c=QJHeJg@mail.gmail.com>
To: Ed Tanous <edtanous@google.com>
X-Mailer: iPad Mail (19C56)
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
Cc: Peter Lundgren <peterlundgren@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, Shawn McCarney <shawnmm@linux.ibm.com>,
 Justin Ledford <justinledford@google.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



Sent from my iPad

> On Feb 11, 2022, at 1:20 PM, Ed Tanous <edtanous@google.com> wrote:
>=20
> =EF=BB=BFOn Fri, Feb 11, 2022 at 8:06 AM Shawn McCarney <shawnmm@linux.ibm=
.com> wrote:
>>=20
>> On 2/11/2022 9:42 AM, Mike Jones wrote:
>>=20
>> I was mainly surprised because a conversation I had with Guenter, if I re=
member correctly, suggested that /dev/i2c calls from user space work with hw=
mon, because hwmon does not lock the i2c except when using it.
>>=20
>> So I assumed that in this case, it was the polling of hwmon that was just=
 keeping it locked enough to conflict with phosphor-regulators and then it g=
ives up.
>>=20
>> With i2c-dev, you can specify I2C_SLAVE or I2C_SLAVE_FORCE when creating t=
he connection.  I believe I2C_SLAVE will cause communication attempts to fai=
l if a driver is bound.  I2C_SLAVE_FORCE will still try to communicate.
>>=20
>> I wanted to take the more conservative approach, because there are scenar=
ios where interleaving communication can cause serious problems.  For exampl=
e, if one PMBus regulator supports multiple rails, you have to set the PMBus=
 PAGE register to the rail you are interested in.  Subsequent PMBus commands=
 will affect that rail.  If phosphor-regulators and a driver are both commun=
icating with the regulator, they may both be setting PAGE and thus their sub=
sequent commands are going to the wrong rail.
>>=20
>>=20
>> I could just not use hwmon at all use phosphor-regulators for all telemet=
ry, but this seemed like more work.
>>=20
>> Sorry about that.  I think if you have already done the work of defining t=
he regulator and a read sensors rule in your JSON file, adding a few more se=
nsors is not much additional work though.  Let me know if you have questions=
.
>>=20
>> Also, I will need to figure out how to connect phosphor-regulators teleme=
try to Redfish and the WebUI. Are there examples of how to do that?
>>=20
>> It should just work with no additional effort as long as you define the f=
ollowing correctly in your JSON file:
>>=20
>> * The "inventory_path" property of your "chassis" object needs to match a=
 real chassis inventory item on D-Bus.
>>=20
>> * The "fru" property of your regulator "device" object needs to match a r=
eal inventory item on D-Bus.  As I mentioned earlier, normally if the regula=
tor is pluggable then this is the regulator itself.  Otherwise it is the lar=
ger hardware item that contains it, such as a motherboard.  FRU is the acron=
ym for Field Replaceable Unit, referring to a pluggable hardware item.
>>=20
>> phosphor-regulators will publish your sensors on D-Bus with the standard o=
bject paths and properties.  The two JSON properties above are used to defin=
e a "chassis" association and an "inventory_item" association on D-Bus that i=
s used by bmcweb.  This will cause your sensors to appear in Redfish and the=
 Web UI.
>>=20
>> Thanks,
>>=20
>> Shawn
>=20
> This same topic is essentially being discussed in a design doc here:
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/50509

I will move my discussion to Gerrit.

Note that I work for ADI, my team supports ADM1266, ADM1278, LTC297X, LTC388=
X, the MAX devices in this category, and I am on the SMIF (PMBus) Board and o=
n the PMBus Technical Committee.

>=20
> I've CCed the relevant parties from that review on this thread, and I
> don't have a strong opinion what forum we use to discuss this, but we
> should ideally all be talking together on a common solution.
