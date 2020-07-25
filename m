Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B624022D37E
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 03:17:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BD7T567xGzF1Q0
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 11:16:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JYaXD4iy; dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BD7SG3GFwzF1Q0
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jul 2020 11:16:13 +1000 (AEST)
Received: by mail-oi1-x234.google.com with SMTP id j11so9548639oiw.12
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 18:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=oLG5lnOqR6ardR+n+P5adeC2o+tX1VjaFzN6m06Cli0=;
 b=JYaXD4iyw4VSVF5g6MnVsHlbMpP4Psgh1eSW1B0ZcSQ2eR2/2vJzucKZCjHP0MJTvn
 O8jaBpK82eosU8MS/RKjEf/fLZBhgh28eiTrtsF0Jm5dCNdUEfnyLIlKiskpfpv5jAEK
 acbmdmSabAZexE07bP6oBgZGvryO36tZMcugo2ut133M56a4NLP5+2ci8GA8mflGzXKu
 qdpQkjc9AGAeQm+/4qquVFJDnlH2Y7Z+Cw3lsfZdm980yTI6wDlsPTbT3tobG5uLoqoT
 Db6QsT++YzJh4U/r44ueybzdAy+l4xu7hdc9zYcgwnononNqORl/gIQa7EVnWay1g7Qn
 zL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=oLG5lnOqR6ardR+n+P5adeC2o+tX1VjaFzN6m06Cli0=;
 b=POkMNog2cgaPAkJ0CQzwNpyO6dVEApPRCnCdFF1dJ9J2t8Lh6+Q9kYBoAn3dDMzNUd
 oa4/IFfJQs8l+kxpi8zjOwzXcGJJpo8nw/quLVPS8+zl4OW0tlXhCFxSrRYKjFmMsvkR
 drvM0Aw4purvsGw3AW3rVqRKbm6ZxYEaYzeDtsxzMFIq3waWYWc7QYeUo6SRYyOH5n8h
 N5qcYuaUxcbxI555Yh+KQSK0+P4uWvF0ltyjFabPmH4J8OmQPT2+TR0tbYjqO0E0F9D9
 urmN4STjgrNtTcIP9DNYiUGVR4b+fvtPQP3r30nvGLu3KPbX8nTOYQYzReWkjE7+smyE
 MagQ==
X-Gm-Message-State: AOAM533pg5+aSf0hBxXV5hyg3vhubiX/y121MgBUk7Kim4/ITwSjrzWr
 qbLicbnJZQO/BLv9yEDwPis=
X-Google-Smtp-Source: ABdhPJwOY9q7WJzyUIsRJTx0FXf83EuuSKngw841l8s6GL7O2Rea2A0hV8JJrhgFf90QNf4oh6QZoQ==
X-Received: by 2002:aca:7289:: with SMTP id p131mr9881918oic.141.1595639770056; 
 Fri, 24 Jul 2020 18:16:10 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:dc25:70f9:d58b:a5c6?
 ([2601:281:c001:2359:dc25:70f9:d58b:a5c6])
 by smtp.gmail.com with ESMTPSA id t83sm656021oot.22.2020.07.24.18.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jul 2020 18:16:09 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Query regarding using the Redfish in OpenBMC
Date: Fri, 24 Jul 2020 19:16:08 -0600
Message-Id: <5A59A07C-0AA9-4924-A22A-546CFAE72F85@gmail.com>
References: <77906538-41BD-4600-B6FE-9886921BB0B9@gmail.com>
In-Reply-To: <77906538-41BD-4600-B6FE-9886921BB0B9@gmail.com>
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

Setting IMAGE_FSTYPES in local.conf got tag 2.7 to compile.

Now I am getting infinite redirects from firefox.

I=E2=80=99m compiling up tag 2.8 to see if that goes away.

If the redirect is a known problem let me know.

Also if there is a solution for missing /var/log/redfish by some trick such t=
hat running bmcweb creates it when missing or its put in the filesystem up f=
ront, let me know. Maybe 2.8 will fix it.

Mike

Sent from my iPad

> On Jul 24, 2020, at 5:12 PM, Mike Jones <proclivis@gmail.com> wrote:
>=20
> =EF=BB=BFSome progress. On the hacked build, there were three problems:
>=20
> 1) bmcweb failed at start
> 2) Wrong port
> 3) Can=E2=80=99t login
>=20
> The failure was found by compiling it with logging. /var/log/redfish was m=
issing. Touching the file and executing bmcweb& got it up.
>=20
> Some doc said port 8080, but it is 18080.
>=20
> DHCP is not working, so I boot to console with hdmi and keyboard and make a=
 static address with ifconfig. Will deal with later.
>=20
> Login was because groups were missing. Found where that was in meta-phosph=
or and added.
>=20
> Now I have the webui up.
>=20
> On the evb build, it is trying to build images that fail when checking fil=
e size. I think this is because meta-phosphor has IMAGE_FSTYPES +=3D with so=
me mtb images, and meta-rasberrypi has IMAGE_FSTYPES ?=3D and I assume +=3D w=
ins or mixes. I think if I add IMAGE_FSTYPES =3D in local.conf, it would ove=
rride it and probably work.
>=20
> Waiting for a long rebuild...
>=20
> Sent from my iPad
>=20
>>>> On Jul 24, 2020, at 3:57 PM, Joseph Reynolds <jrey@linux.ibm.com> wrote=
:
>>>=20
>>> =EF=BB=BFOn 7/24/20 8:40 AM, Mike wrote:
>>> I=E2=80=99m trying to do the same and struggling to get it up on a Rasp P=
i 4.
>>> My first approach was to add layers to meta-raspberrypi, and I got to th=
e point where the web was up, but I could not log in with root. I added a mi=
ssing layer that adds groups to the accounts and will test later today.
>>> The second approach was to use the evb config files. But it can=E2=80=99=
t make the image. It seems to be using meta-phosphor image layers instead of=
 meta-raspberrypi layers. I used openbmc tag 2.9. I will try 2.8 later and s=
ee if it compiles.
>>=20
>> I think your build configuration would include both the meta-raspberrypi a=
nd meta-phosphor layers.
>> The meta-phosphor layer brings in the BMCWeb recipe [1] and BMCWeb enable=
s Redfish by default [2].
>> So I think your approach should work, but I do not have experience settin=
g up machines.
>> Andrew added a tutorial for this [3].
>>=20
>> [1]: https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes=
-phosphor/interfaces/bmcweb_git.bb
>> [2]: https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L37
>> [3]: https://gist.github.com/geissonator/77d4f6c6ed17bb0693b4251137f77fb4=

>>=20
>> The root password is configured in the phosphor-defaults.inc [4] (and oth=
er places such as in various EVB layers) and the root user is authorized to u=
se redfish APIs per the bmcweb recipe ([1] again).
>>=20
>> [4]: https://github.com/openbmc/openbmc/blob/master/meta-phosphor/conf/di=
stro/include/phosphor-defaults.inc#L229
>>=20
>> Note the default port for BMCWeb is 443 (HTTPS).
>>=20
>> A few more questions:
>> 1. How are you getting the RPI's IP address?  Are you just looking for it=
, or do you learn it by using the RPI's serial connection and signing in?
>> 2. Are you using the RPI's serial port to debug?  If so, can you sign on a=
s root?  If you can, does the systemctl command show the bmcweb service is r=
unning?  If it is, does bmcweb show any error messages for failed attempts t=
o use Redfish APIs?
>>=20
>> - Joseph
>>=20
>>> I will post more details later. I can provide config files etc. I am awa=
y from my computer for awhile.
>>> How are you building? Are you using an evb config? What tag are you usin=
g?
>>> Sent from my iPhone
>>>>> On Jul 24, 2020, at 6:01 AM, khader basha shaik <shaikkhaderbasha601@g=
mail.com> wrote:
>>>> =EF=BB=BF
>>>> Hi Joseph,
>>>> Thanks for your response.
>>>> I will be using Raspberrypi3 system.
>>>> Can you please guide what further steps I should take in order to view t=
he /redfish/v1 content in the web(https://xxx.xxx.xxx:8000/redfish/v1).
>>=20
>> The default port is 443 (HTTPS) unless you changed it in a recipe. (This i=
s not common.)
>> If you continue to enter "https:" you should not need to specify port.
>>=20
>>>> Any pointer on this is really helpful.
>>>> I have gone through the documents the developer docs but could not find=
 anything that points to enabling the redfish stuff in the browser.
>>>> Please correct me if i am wrong
>>>> Thanks & Regards,
>>>> Khader B Shaik
>>>>> On Thu, 23 Jul 2020 at 19:25, Joseph Reynolds <jrey@linux.ibm.com <mai=
lto:jrey@linux.ibm.com>> wrote:
>>>>>  On 7/23/20 5:48 AM, khader basha shaik wrote:
>>>>> Hi Team,
>>>>> I am newbiee to  Openbmc.  I want to view  the redfish/v1
>>>>> (https://10.xxx.xxx.xxx:8000/redfish/v1) contents in the browser
>>>>> .Could you please guide me on what changes i need to so
>>>>  that i view
>>>>> the /redfish/v1/ content in the browser .
>>>>> here are the steps i have followed:
>>>>> 1. Clone OpenBMC project : git clone
>>>>> https://github.com/openbmc/openbmc.git in the server machine .
>>>>> 2. Compile using the following command:
>>>>>   TEMPLATECONF=3Dmeta-phosphor/conf  . openbmc-env
>>>>> 3. modify the following files:
>>>>> *  #build vi conf/local.conf  (modify the  line
>>>>  "-MACHINE??=3Dqemuarm"
>>>>>   " to "-MACHINE??=3Draspberrypi3-64" "
>>>>> * #build vi conf/bblayer.conf (add the following line
>>>>> "/home/khader<username>/openbmc/meta-raspberrypi \"  to the line
>>>>>   above /home/khader<username>/openbmc/metaphosphor \"
>>>>>      4. #build  bitbake obmc-phosphor-image
>>>>> The above steps I have used to build an Openbmc project.
>>>>> Can you help me what further steps should i need to do so that
>>>>  i can
>>>>> view the /redfish/v1/  content in the webbrowser.
>>>>  What BMC system will you use to upload, boot, and run the BMC
>>>>  firmware
>>>>  image?  A QEMU virtual system?
>>>>  Have you seen the developer docs here?
>>>>  https://github.com/openbmc/docs/tree/master/development
>>>>  Good luck,
>>>>  - Joseph
>>>>> Note:- I am compiling the openbmc code in the server machine.
>>>>> Any help /guidelines on this will really help me alot.
>>>>> Appreciate all your help.
>>>>> Thanks & Regards,
>>>>> khader B Shaik
