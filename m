Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 845084B2E5A
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 21:20:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwQ3h0tGCz3cM5
	for <lists+openbmc@lfdr.de>; Sat, 12 Feb 2022 07:20:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aCPw83fs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42a;
 helo=mail-wr1-x42a.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=aCPw83fs; dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwQ3F3Xz4z3bbW
 for <openbmc@lists.ozlabs.org>; Sat, 12 Feb 2022 07:20:23 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id o24so14406057wro.3
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 12:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ChzrFn58ov+zTOdaAxSrDVPbrK6lcu83c25lZhy/HPA=;
 b=aCPw83fs+bqj/3Twjb3F0fX06NLcV7PHO32p+2mRwglIhdr3XI0KGT+czwlBUEZ1mD
 XTz6bhEpLxmagBXwsIdvIFgUq//Cv4pdYIRSLx1RreJyHlI3Zd6k/GlvewU11F1KXHCF
 Eq2BKfxhP2d3Ps8f/KnyWR/phK/CCxm2/Rc1c7gKtmzhFwFDUUZmLR51kwfCnGaS1bje
 sPntHjqVHp1WEgP/EtJ6WM0Qp74ApmxUjJpIOckBZSwXqFT/rYVDj1cmV9CtiwQ3XlPi
 nWQM5qOs2LxRg9+Qy2wV94xen9Gdyc9gcSCDGEveVbnjc7fkavQ+3juZlJ/RPuQ15AeH
 M+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ChzrFn58ov+zTOdaAxSrDVPbrK6lcu83c25lZhy/HPA=;
 b=Jk4JOuoxfuEPvI07FE8ZUDGhto7RDKlG5ovk0Q1qi3C/LLPQuSL5HAO9XCc4yMW7Hz
 4At1+bnqfx0zCbcIgxP/HorO4Wimz0lBeeQxX5KkQjQMRyzyUxEz2C7avNFymXKNj8QJ
 aKm33OGEgPg6N9VQGmLkKE5RI+ngY8RlRQtSzZkhbAvw95iKflsGJRxFeV5Tn1rPVtWU
 up7jb64moj820bTehBBHvxGq81drcuhhb49q/r5Eqtb4e8ogTOkLMtWPs/CWZ7N9R8u4
 obedHinl8fxL9Ep1CXt927U2XhH12DtBoPy+mc4STg83w4V8w6SMMJkucnnH0uh59UZr
 7Rpw==
X-Gm-Message-State: AOAM531eu+hiBYnmHryLefElhdspowvOFQuuFaIPvX+G1fglPuuzGUwJ
 KmKbLq6Y1kMCX7aNCk757DSmpj4O9npVxGRCFidf1w==
X-Google-Smtp-Source: ABdhPJyLdT1szufBQqUuQoWaUHHBc1exQPHMph0+n+vK6wb6Lk3/HfurwnQ42+1pbZrDkulJ3mYid4m8IHrB28NwkGA=
X-Received: by 2002:a5d:6d85:: with SMTP id l5mr2611585wrs.425.1644610816490; 
 Fri, 11 Feb 2022 12:20:16 -0800 (PST)
MIME-Version: 1.0
References: <9aaceaed-1a8a-6a13-d650-8f4678d267d4@linux.ibm.com>
 <6D1561E1-59FC-4126-9271-A7C8BFDB0B11@gmail.com>
 <1858988f-100f-b3b4-c599-80cddaa7247a@linux.ibm.com>
 <DCAD9B4C-D047-40A0-B4AD-1D21C0CF6197@gmail.com>
 <5d8e7a32-667e-be32-3c01-160e5bd6b4a1@linux.ibm.com>
In-Reply-To: <5d8e7a32-667e-be32-3c01-160e5bd6b4a1@linux.ibm.com>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 11 Feb 2022 12:20:05 -0800
Message-ID: <CAH2-KxCOOqoXmBLmR+=Jjrea1fouCOYOb4pGwZHwk5c=QJHeJg@mail.gmail.com>
Subject: Re: No dbus objects for phosphor-regulators
To: Shawn McCarney <shawnmm@linux.ibm.com>,
 Justin Ledford <justinledford@google.com>, 
 Gunnar Mills <gmills@linux.vnet.ibm.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Adriana Kobylak <anoo@linux.ibm.com>, Peter Lundgren <peterlundgren@google.com>,
 Jason Ling <jasonling@google.com>
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
Cc: openbmc@lists.ozlabs.org, Mike Jones <proclivis@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Feb 11, 2022 at 8:06 AM Shawn McCarney <shawnmm@linux.ibm.com> wrot=
e:
>
> On 2/11/2022 9:42 AM, Mike Jones wrote:
>
> I was mainly surprised because a conversation I had with Guenter, if I re=
member correctly, suggested that /dev/i2c calls from user space work with h=
wmon, because hwmon does not lock the i2c except when using it.
>
> So I assumed that in this case, it was the polling of hwmon that was just=
 keeping it locked enough to conflict with phosphor-regulators and then it =
gives up.
>
> With i2c-dev, you can specify I2C_SLAVE or I2C_SLAVE_FORCE when creating =
the connection.  I believe I2C_SLAVE will cause communication attempts to f=
ail if a driver is bound.  I2C_SLAVE_FORCE will still try to communicate.
>
> I wanted to take the more conservative approach, because there are scenar=
ios where interleaving communication can cause serious problems.  For examp=
le, if one PMBus regulator supports multiple rails, you have to set the PMB=
us PAGE register to the rail you are interested in.  Subsequent PMBus comma=
nds will affect that rail.  If phosphor-regulators and a driver are both co=
mmunicating with the regulator, they may both be setting PAGE and thus thei=
r subsequent commands are going to the wrong rail.
>
>
> I could just not use hwmon at all use phosphor-regulators for all telemet=
ry, but this seemed like more work.
>
> Sorry about that.  I think if you have already done the work of defining =
the regulator and a read sensors rule in your JSON file, adding a few more =
sensors is not much additional work though.  Let me know if you have questi=
ons.
>
> Also, I will need to figure out how to connect phosphor-regulators teleme=
try to Redfish and the WebUI. Are there examples of how to do that?
>
> It should just work with no additional effort as long as you define the f=
ollowing correctly in your JSON file:
>
> * The "inventory_path" property of your "chassis" object needs to match a=
 real chassis inventory item on D-Bus.
>
> * The "fru" property of your regulator "device" object needs to match a r=
eal inventory item on D-Bus.  As I mentioned earlier, normally if the regul=
ator is pluggable then this is the regulator itself.  Otherwise it is the l=
arger hardware item that contains it, such as a motherboard.  FRU is the ac=
ronym for Field Replaceable Unit, referring to a pluggable hardware item.
>
> phosphor-regulators will publish your sensors on D-Bus with the standard =
object paths and properties.  The two JSON properties above are used to def=
ine a "chassis" association and an "inventory_item" association on D-Bus th=
at is used by bmcweb.  This will cause your sensors to appear in Redfish an=
d the Web UI.
>
> Thanks,
>
> Shawn

This same topic is essentially being discussed in a design doc here:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/50509

I've CCed the relevant parties from that review on this thread, and I
don't have a strong opinion what forum we use to discuss this, but we
should ideally all be talking together on a common solution.
