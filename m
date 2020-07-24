Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1DE22D218
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 01:13:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BD4kC1gT1zF1Z9
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 09:13:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n2ZHt30w; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BD4jR1TPXzF1Wr
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jul 2020 09:12:25 +1000 (AEST)
Received: by mail-oi1-x243.google.com with SMTP id l63so9363866oih.13
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 16:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:mime-version:subject:from:in-reply-to:cc
 :date:message-id:references:to;
 bh=atGzp7KEZDmbG1GruYsYzkSJ3NTISXIK8VbjKExvUZI=;
 b=n2ZHt30wOHOwD7fIw0DhNnSgDPvKFxyq9CKjcgBTenLPagQBs3O7v7fDXFQtcGKU/v
 2iexIBDMLzG0vNgFsMX02VsuGQcZgJiG44rFKiZPqBMwPtcUvaz6UTS3RgAKRaCPCjKJ
 mONwkRAzp4SuE8qOzdGT0v3dyTt2gnL/cZPn15hmQ25BU5JkhidnGDfJNNwCb6p7aTrd
 2B3ipsvU8uBkZVJVAklXhtc9KWDtSl1bS7+sLZrjruP+xdona6Fxt5TQslMktmyCglmP
 jtr0j5FNDGnBPcFUm8M+kWTc1k3NbnrtJ5j+flVr70NV01BDDiETbPenpE4d38gyImYu
 wLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:mime-version:subject
 :from:in-reply-to:cc:date:message-id:references:to;
 bh=atGzp7KEZDmbG1GruYsYzkSJ3NTISXIK8VbjKExvUZI=;
 b=JVBd9ZvkPMDaVbZtRSRxKwSH/8p/LtrYmTQO+LwLPM6xStNHuQpOvyIgpItYptGiH2
 CAEd9LvuRHj4/j1C29CCVlVmMUnNTBDe1GHQGehqdvs/UQWMiutH9ZhHByWzeHcyO2+R
 duY932bUK+EcJmOjkIK/24D7ChQvEkq85ClgZnnfAeEEl71EQDGrx3UWoizsgjTaXOrT
 KOuQkqHDxezcsEUYShSqLLTJK62LDd1aQb6RKhn9Dw2MLlogMs6P3A4x7iLyEBLIFHvu
 iqeYca6kM650dMSJvju9wN0RPbDK07dNY7jNGoCB+w3eQHotMJEc0iIEOSK6MhsTQ62E
 +IHQ==
X-Gm-Message-State: AOAM531Uyzej4WiWG+GoUatkIguS1CUrI+fq9Jd+hXNYDaF0UaGQYiZM
 nvYXEK7oUgQQ4zuTx9KetBI=
X-Google-Smtp-Source: ABdhPJyWzvLdXPWAhNW/f694yl+kOD+6q8Izs6GhNyxH7xnW7DQUCnRB7TP941M5mBGkn605eHfjUg==
X-Received: by 2002:aca:bb82:: with SMTP id
 l124mr10228826oif.106.1595632341512; 
 Fri, 24 Jul 2020 16:12:21 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:dc25:70f9:d58b:a5c6?
 ([2601:281:c001:2359:dc25:70f9:d58b:a5c6])
 by smtp.gmail.com with ESMTPSA id x138sm431110oif.5.2020.07.24.16.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jul 2020 16:12:20 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: Query regarding using the Redfish in OpenBMC
From: Mike Jones <proclivis@gmail.com>
In-Reply-To: <30dabaf6-b18d-a94b-af46-3291233b5ad1@linux.ibm.com>
Date: Fri, 24 Jul 2020 17:12:20 -0600
Message-Id: <77906538-41BD-4600-B6FE-9886921BB0B9@gmail.com>
References: <30dabaf6-b18d-a94b-af46-3291233b5ad1@linux.ibm.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
X-Mailer: iPad Mail (17F80)
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
Cc: khader basha shaik <shaikkhaderbasha601@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "openbmcbump-github@yahoo.com" <openbmcbump-github@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Some progress. On the hacked build, there were three problems:

1) bmcweb failed at start
2) Wrong port
3) Can=E2=80=99t login

The failure was found by compiling it with logging. /var/log/redfish was mis=
sing. Touching the file and executing bmcweb& got it up.

Some doc said port 8080, but it is 18080.

DHCP is not working, so I boot to console with hdmi and keyboard and make a s=
tatic address with ifconfig. Will deal with later.

Login was because groups were missing. Found where that was in meta-phosphor=
 and added.

Now I have the webui up.

On the evb build, it is trying to build images that fail when checking file s=
ize. I think this is because meta-phosphor has IMAGE_FSTYPES +=3D with some m=
tb images, and meta-rasberrypi has IMAGE_FSTYPES ?=3D and I assume +=3D wins=
 or mixes. I think if I add IMAGE_FSTYPES =3D in local.conf, it would overri=
de it and probably work.

Waiting for a long rebuild...

Sent from my iPad

>> On Jul 24, 2020, at 3:57 PM, Joseph Reynolds <jrey@linux.ibm.com> wrote:
>>=20
>> =EF=BB=BFOn 7/24/20 8:40 AM, Mike wrote:
>> I=E2=80=99m trying to do the same and struggling to get it up on a Rasp P=
i 4.
>> My first approach was to add layers to meta-raspberrypi, and I got to the=
 point where the web was up, but I could not log in with root. I added a mis=
sing layer that adds groups to the accounts and will test later today.
>> The second approach was to use the evb config files. But it can=E2=80=99t=
 make the image. It seems to be using meta-phosphor image layers instead of m=
eta-raspberrypi layers. I used openbmc tag 2.9. I will try 2.8 later and see=
 if it compiles.
>=20
> I think your build configuration would include both the meta-raspberrypi a=
nd meta-phosphor layers.
> The meta-phosphor layer brings in the BMCWeb recipe [1] and BMCWeb enables=
 Redfish by default [2].
> So I think your approach should work, but I do not have experience setting=
 up machines.
> Andrew added a tutorial for this [3].
>=20
> [1]: https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-=
phosphor/interfaces/bmcweb_git.bb
> [2]: https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L37
> [3]: https://gist.github.com/geissonator/77d4f6c6ed17bb0693b4251137f77fb4
>=20
> The root password is configured in the phosphor-defaults.inc [4] (and othe=
r places such as in various EVB layers) and the root user is authorized to u=
se redfish APIs per the bmcweb recipe ([1] again).
>=20
> [4]: https://github.com/openbmc/openbmc/blob/master/meta-phosphor/conf/dis=
tro/include/phosphor-defaults.inc#L229
>=20
> Note the default port for BMCWeb is 443 (HTTPS).
>=20
> A few more questions:
> 1. How are you getting the RPI's IP address?  Are you just looking for it,=
 or do you learn it by using the RPI's serial connection and signing in?
> 2. Are you using the RPI's serial port to debug?  If so, can you sign on a=
s root?  If you can, does the systemctl command show the bmcweb service is r=
unning?  If it is, does bmcweb show any error messages for failed attempts t=
o use Redfish APIs?
>=20
> - Joseph
>=20
>> I will post more details later. I can provide config files etc. I am away=
 from my computer for awhile.
>> How are you building? Are you using an evb config? What tag are you using=
?
>> Sent from my iPhone
>>>> On Jul 24, 2020, at 6:01 AM, khader basha shaik <shaikkhaderbasha601@gm=
ail.com> wrote:
>>> =EF=BB=BF
>>> Hi Joseph,
>>> Thanks for your response.
>>> I will be using Raspberrypi3 system.
>>> Can you please guide what further steps I should take in order to view t=
he /redfish/v1 content in the web(https://xxx.xxx.xxx:8000/redfish/v1).
>=20
> The default port is 443 (HTTPS) unless you changed it in a recipe. (This i=
s not common.)
> If you continue to enter "https:" you should not need to specify port.
>=20
>>> Any pointer on this is really helpful.
>>> I have gone through the documents the developer docs but could not find a=
nything that points to enabling the redfish stuff in the browser.
>>> Please correct me if i am wrong
>>> Thanks & Regards,
>>> Khader B Shaik
>>>> On Thu, 23 Jul 2020 at 19:25, Joseph Reynolds <jrey@linux.ibm.com <mail=
to:jrey@linux.ibm.com>> wrote:
>>>>   On 7/23/20 5:48 AM, khader basha shaik wrote:
>>>> Hi Team,
>>>> I am newbiee to  Openbmc.  I want to view  the redfish/v1
>>>> (https://10.xxx.xxx.xxx:8000/redfish/v1) contents in the browser
>>>> .Could you please guide me on what changes i need to so
>>>   that i view
>>>> the /redfish/v1/ content in the browser .
>>>> here are the steps i have followed:
>>>> 1. Clone OpenBMC project : git clone
>>>> https://github.com/openbmc/openbmc.git in the server machine .
>>>> 2. Compile using the following command:
>>>>    TEMPLATECONF=3Dmeta-phosphor/conf  . openbmc-env
>>>> 3. modify the following files:
>>>>  *  #build vi conf/local.conf  (modify the  line
>>>   "-MACHINE??=3Dqemuarm"
>>>>    " to "-MACHINE??=3Draspberrypi3-64" "
>>>>  * #build vi conf/bblayer.conf (add the following line
>>>> "/home/khader<username>/openbmc/meta-raspberrypi \"  to the line
>>>>    above /home/khader<username>/openbmc/metaphosphor \"
>>>>       4. #build  bitbake obmc-phosphor-image
>>>> The above steps I have used to build an Openbmc project.
>>>> Can you help me what further steps should i need to do so that
>>>   i can
>>>> view the /redfish/v1/  content in the webbrowser.
>>>   What BMC system will you use to upload, boot, and run the BMC
>>>   firmware
>>>   image?  A QEMU virtual system?
>>>   Have you seen the developer docs here?
>>>   https://github.com/openbmc/docs/tree/master/development
>>>   Good luck,
>>>   - Joseph
>>>> Note:- I am compiling the openbmc code in the server machine.
>>>> Any help /guidelines on this will really help me alot.
>>>> Appreciate all your help.
>>>> Thanks & Regards,
>>>> khader B Shaik
