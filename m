Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFB56D8BD2
	for <lists+openbmc@lfdr.de>; Thu,  6 Apr 2023 02:26:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsMk10Dqgz3fVC
	for <lists+openbmc@lfdr.de>; Thu,  6 Apr 2023 10:26:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MSAd7uCl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=lukmantaqua@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MSAd7uCl;
	dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrsTW25Y1z3bNn
	for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2023 14:43:42 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id g19so33997704qts.9
        for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2023 21:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680669815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VqvwfjnROBCf6BlLL58Ien1EB8ZG7WeaIIl2ObNIPSM=;
        b=MSAd7uClpR+O2O7mkN4BCLEd0dXQBoDLmUjysrlTMVy7oTxf5QX8yWS/3Gsjo6cfGu
         vHn5ysQobhKwz+I6Ni8F+zt6/Q1+vjHAldu4bq0Tm1sSVK4ALqOkii3UxI9Ml6gRP6WR
         V+O4Qm3YyvX7CZde/6auiHquqoWlqDcIiwkLL56p5nynbASzE1q9Pp7qwldSoxMUF7fd
         HedcHRYO/2s7QZHErjPCRAgiChGxC0849j2tezFxSLU2YJH9tLXG6Ntj+0wtRrVVwcDM
         nSf5RnWk9yQxgjIeRz5SFZ4/hwJ8Q5qZYghYgR9d93PT6VqWW6hX0USbnWjZp4UaefSt
         Rnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680669815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqvwfjnROBCf6BlLL58Ien1EB8ZG7WeaIIl2ObNIPSM=;
        b=B/MGVhtDGHv9yivDo0emrg0fIr2zRIIFo54CUFyo7ymucidjFJ8SjgJvHX47DoRd8e
         DsrYs5NZ1cnOoCtBjXuwrKYrTBw2hvodhd1ARtYg07fZlNaQZ9xYsxscvP9ANDQXKeWI
         q4+86iLQSP54TW5iOXApgD1SRAojmhEVTqBO49AfHPo1J6sZ1lOpflGqS1dIaXF4qdHO
         rVJvfmEKY56lN6nlfvUa2JUYCmcPr+RXW7TChmVRqTDlQ6VJQthD8gyWgfGaQErL3Q9q
         +pNhPse75fz2IMwrvF7DeHvced/iFHHhzcw+gSeWsjECaxeiG0AuET5PnKk6+EgYFrFV
         xetA==
X-Gm-Message-State: AAQBX9eid1bsTuDfltrwUGBVtUYTav5tERLSZ+tfPTqTR4CrUR3dbxLE
	9MLJdr1r0hTV7o2ECssKqxw1ceFATyijaly23Eo=
X-Google-Smtp-Source: AKy350ZLLnYuTVWXSikbP5EAUJQlop1mjpL5fjI5OLoTTYPwIbtURi4zmmxe6JfxzPf5AygaMytpgT/Iao6/QcqTpU4=
X-Received: by 2002:ac8:5a43:0:b0:3e1:3cc8:98b5 with SMTP id
 o3-20020ac85a43000000b003e13cc898b5mr730563qta.4.1680669815258; Tue, 04 Apr
 2023 21:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAD8XohkKcKAgz2qZmiNKtY=878_uj8RWWzUXFnTKA2tV+9MWJQ@mail.gmail.com>
 <CAO=notzbOiDgAEO3qHOUqGJD6+kheMDNQ2L0brdsmANsy3==OQ@mail.gmail.com>
In-Reply-To: <CAO=notzbOiDgAEO3qHOUqGJD6+kheMDNQ2L0brdsmANsy3==OQ@mail.gmail.com>
From: Lukman Mhd <lukmantaqua@gmail.com>
Date: Wed, 5 Apr 2023 10:13:06 +0530
Message-ID: <CAD8XohntKrXym3C4nWGdgvbGuCDpUO1TGRsBkhR=QUuGBt78fQ@mail.gmail.com>
Subject: Re: Reg. phosphor-ipmi-flash in openBMC
To: Patrick Venture <venture@google.com>
Content-Type: multipart/alternative; boundary="00000000000052c29805f88f6f4a"
X-Mailman-Approved-At: Thu, 06 Apr 2023 10:25:49 +1000
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

--00000000000052c29805f88f6f4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your response.

Thanks a lot,
Muhamadlukman.

On Tue, Apr 4, 2023 at 10:03=E2=80=AFPM Patrick Venture <venture@google.com=
> wrote:

> +OpenBMC Maillist <openbmc@lists.ozlabs.org>
>
> On Tue, Apr 4, 2023 at 1:53=E2=80=AFAM Lukman Mhd <lukmantaqua@gmail.com>=
 wrote:
>
>> Hi Patrick,
>>
>> This is MuhamadLukman from India working as a software developer in
>> oneAMI. This email is to inquire about a few things about
>> phosphor-ipmi-flash in the openBMC project. Kindly help to provide your
>> valuable suggestion as it could be a great help for me.
>>
>> I have built open source host tool burn_my_bmc and built an openBMC
>> target image for evb-ast2500/evb-ast2600. When I try to flash BMC from t=
he
>> host machine using burn_my_bmc, I'm always getting below output for all =
the
>> interfaces like ipmibt,ipminet,ipmipci,ipmilpc
>> example:
>> *./burn_my_bmc --command update --interface ipmipci --image image-bmc
>> --sig image-bmc.sig --type image*
>> /flash/image not found
>> Exception received: Goal firmware not supported
>>
>> I have configured openBMC recipes (recipes-phosphor/ipmi) to support
>> phosphor-ipmi-flash in meta-evb-ast2500/meta-evb-ast2600 as below:
>>
>>
>> *\openbmc-master\meta-evb\meta-evb-aspeed\meta-evb-ast2500\recipes-phosp=
hor\ipmi\phosphor-ipmi-flash_%.bbappend*
>>
>> PACKAGECONFIG:append:evb-ast2500 =3D " static-bmc net-bridge aspeed-lpc
>> host-bios reboot-update"
>> IPMI_FLASH_BMC_ADDRESS:evb-ast2500 =3D "0x99000000"
>>
>> Could you please advise me why it throws "Exception received: Goal
>> firmware not supported" always. How to configure in-band flash support i=
n
>> evb-ast2500 target.
>> Whether in band flashing support not enabled by default in target
>> machines. If so, how can I configure and overcome this issue?
>> Could you please explain and provide elaborated steps for flashing
>> openBMC via phosphor-ipmi-flash.
>>
>>
> I no longer maintain this, see:
> https://github.com/openbmc/phosphor-ipmi-flash/blob/master/OWNERS for the
> list of current maintainers who can help solve your issue.
>
>
>> Your help is much appreciated.
>> Thanks a lot,
>> MuhamadLukman.
>>
>>
>>

--00000000000052c29805f88f6f4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for your response.<div><br></div><div>Thanks a l=
ot,</div><div>Muhamadlukman.=C2=A0<br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 4, 2023 at 10:03=E2=
=80=AFPM Patrick Venture &lt;<a href=3D"mailto:venture@google.com">venture@=
google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><a class=3D"gmail_plusreply" i=
d=3D"m_8689622964105963885gmail-plusReplyChip-1" href=3D"mailto:openbmc@lis=
ts.ozlabs.org" target=3D"_blank">+OpenBMC Maillist</a>=C2=A0</div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 4, =
2023 at 1:53=E2=80=AFAM Lukman Mhd &lt;<a href=3D"mailto:lukmantaqua@gmail.=
com" target=3D"_blank">lukmantaqua@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Patrick,<di=
v><br></div><div><div>This is MuhamadLukman from India working as a softwar=
e developer in oneAMI. This email is to inquire about a few things about ph=
osphor-ipmi-flash in the openBMC project. Kindly help to provide your valua=
ble suggestion as it could be a great help for me.<br></div><div><div><div>=
<div><div><br></div><div>I have built open source host tool burn_my_bmc and=
 built an openBMC target image for evb-ast2500/evb-ast2600. When I try to f=
lash BMC from the host machine using burn_my_bmc, I&#39;m always getting be=
low output for all the interfaces like ipmibt,ipminet,ipmipci,ipmilpc</div>=
<div>example:</div><div><b>./burn_my_bmc --command update --interface ipmip=
ci --image image-bmc --sig image-bmc.sig --type image</b><br></div><div>/fl=
ash/image not found<br>Exception received: Goal firmware not supported<br><=
/div><div><br></div><div>I have configured openBMC recipes (recipes-phospho=
r/ipmi) to support phosphor-ipmi-flash in meta-evb-ast2500/meta-evb-ast2600=
 as below:</div><div><br></div><div><b>\openbmc-master\meta-evb\meta-evb-as=
peed\meta-evb-ast2500\recipes-phosphor\ipmi\phosphor-ipmi-flash_%.bbappend<=
/b><br></div><div><b><br></b></div><div>PACKAGECONFIG:append:evb-ast2500 =
=3D &quot; static-bmc net-bridge aspeed-lpc host-bios reboot-update&quot;<b=
r>IPMI_FLASH_BMC_ADDRESS:evb-ast2500 =3D &quot;0x99000000&quot;<b><br></b><=
/div><div><br></div><div>Could you please advise me why it throws &quot;Exc=
eption received: Goal firmware not supported&quot; always. How to configure=
 in-band flash support in evb-ast2500 target.=C2=A0</div><div>Whether in ba=
nd flashing support not enabled by default in target machines. If so, how c=
an I configure and overcome this issue?=C2=A0</div><div>Could you please ex=
plain and provide elaborated steps for flashing openBMC via phosphor-ipmi-f=
lash.=C2=A0</div><div><br></div></div></div></div></div></div></div></block=
quote><div><br></div><div>I no longer maintain this, see:=C2=A0<a href=3D"h=
ttps://github.com/openbmc/phosphor-ipmi-flash/blob/master/OWNERS" target=3D=
"_blank">https://github.com/openbmc/phosphor-ipmi-flash/blob/master/OWNERS<=
/a> for the list of current maintainers who can help solve your issue.</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div><div><div><div><div><div></div><div>Your help is much apprec=
iated.</div><div>Thanks a lot,<br></div><div>MuhamadLukman.</div></div></di=
v></div></div><div><br></div><div><br></div></div></div>
</blockquote></div></div>
</blockquote></div>

--00000000000052c29805f88f6f4a--
