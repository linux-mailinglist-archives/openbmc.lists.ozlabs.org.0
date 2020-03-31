Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0A519A0EC
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 23:38:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sN3S1y25zDqw1
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 08:37:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::133;
 helo=mail-il1-x133.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=AD0PoVzA; dkim-atps=neutral
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sN2V3vtczDqN9
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 08:37:06 +1100 (AEDT)
Received: by mail-il1-x133.google.com with SMTP id r5so20992270ilq.6
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 14:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=15YDO/EZFgSQ3g7X64QJNyaVQLgLjZ1nzQ1mFuHjBJ8=;
 b=AD0PoVzAhpr7636JVU/ht7dAvzw8eYlUX+i8M4TNUHgHM4GBBjbdktEKPR+Kwk/ypM
 qFD760dGqE+nmAQXLq6rV3pJGvmyLDMedGnsYfumglZYYsFkWfGQ2g8YzA1MqjlrTT9E
 AF1ulD9HQAJa4TycCDT096SYX1EF69QFbGaiLSuTwDRCNLVxaQF9iGP00wnQ/4EBX9+s
 bL0A3t8+z4PiCJ6C9NC7HlcYdHBf+F8Rey70joXxPIGMa5cKmlueqhY+8s9J9VaBWKAH
 /X8aIxw4Lj6N358IeZw7VH/YDuDYwZX6bgk+WpBzCafy/uPwWF/pC85aTjzIkaRKdGd4
 tB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=15YDO/EZFgSQ3g7X64QJNyaVQLgLjZ1nzQ1mFuHjBJ8=;
 b=FxP+fQhBYlvnlveLRPoffGrBv286pMWxVR74OorVWplL+rHWeaj7IdkURNpUIO2cKI
 SOxJ+ED9HIZyY5AiZUNenrYIkgHbq7zHGj+UexUGAfntr3LWQpKgbBAiXiVPfjzCJSvo
 xlPoCVMlpFvrsg4kUp1Eb3WlTMNTPC+OWkgPWSGW/Zch4/J/l5cHHv/tt6LVw3lAzoew
 pnvIXnYy7XI5c397BKqjusT05926uY+WK/XgeHJ4SJLXr4tJ2pgFynWwJ3ev195/rDI1
 u8as4fK9nZcJr2gVKgK8FCo5ObWwI049U9K/pEQ2Du8SuUR1vilJo/27xCG1rjHFqCTY
 ue7w==
X-Gm-Message-State: ANhLgQ3NW1J3DedK0nJ0MQD0+JhdMwmVDMNPb5luyLNyq1g7Vgx3X8n+
 3TcPMod1QjVP79IBAfOyK6JedX76tvdq0bJ6CQyjfg==
X-Google-Smtp-Source: ADFU+vuLyqwxYtaAuNBzNKUApTO09EjmpkH1/6DQ1CoQAJ/Bc43ZmUppwiAovdFSRiKuBFMhJjooiOdtFhp0/pEYAZg=
X-Received: by 2002:a92:c809:: with SMTP id v9mr4426876iln.126.1585690622378; 
 Tue, 31 Mar 2020 14:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <F69B446C-E70B-4B04-83A1-618A4F60E965@fb.com>
 <CADKL2t6nach67q57ca==uqHHEVCf=+F3PBOcQ1v0ZAazk6Yr+Q@mail.gmail.com>
 <40F2216B-79C3-409E-BBBA-C10D5347DCFC@fb.com>
 <CAPnigKnFwVdp7G4PpFcFHHjdJsPBdgD8n6SBTkf1E6kAzHUH0g@mail.gmail.com>
In-Reply-To: <CAPnigKnFwVdp7G4PpFcFHHjdJsPBdgD8n6SBTkf1E6kAzHUH0g@mail.gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Tue, 31 Mar 2020 14:36:25 -0700
Message-ID: <CADKL2t50wuieseKiV9Y8pbkDjqE_me66C7X1VMsT6ngy4+NtDA@mail.gmail.com>
Subject: Re: Chassis sled cycle
To: William Kennington <wak@google.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 Vijay Khemka <vijaykhemka@fb.com>, James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

That's right, each platform can register whichever service is needed
to perform the actual reset. On some systems there's a BMC GPIO routed
to the HSC that tells it to perform a reset which is equivalent to
removing and reapplying AC power.

I'm not sure how POWER_RESET differs from this reset type.

On Tue, 31 Mar 2020 at 13:53, William Kennington <wak@google.com> wrote:
>
> It could be a GPIO on some systems or it could be I2C on others. It just =
depends on the hotswap controller used for the platforms. That's why it is =
a systemd target with arbitrary scripting provided by the platform.
>
> On Tue, Mar 31, 2020 at 1:49 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>>
>>
>>
>> =EF=BB=BFOn 3/31/20, 10:53 AM, "Benjamin Fair" <benjaminfair@google.com>=
 wrote:
>>
>>     On Mon, 30 Mar 2020 at 13:00, Vijay Khemka <vijaykhemka@fb.com> wrot=
e:
>>     >
>>     > Hi Jason,
>>     >
>>     > We have a requirement of Chassis sled cycle and it can be achieved=
 by sending an i2c command to hotswap controller. Is there any plan to add =
this feature in x86-power-control. It should take i2c bus address from conf=
iguration file.
>>     >
>>     >
>>     >
>>     > Regards
>>     >
>>     > -Vijay
>>
>>     This feature is implemented on some systems using an IPMI OEM comman=
d:
>>     https://github.com/openbmc/google-ipmi-sys#delayedhardreset---subcom=
mand-0x03
>>
>>     It currently just activates the systemd target
>>     gbmc-psu-hardreset.target and lets you register services to do the
>>     actual hotswap reset (usually by toggling a GPIO). Having a unified
>>     solution in x86-power-control for this would be great!
>>
>> Ben, please clarify if this is same as power reset or different from pow=
er reset. As HSC reset
>> is being triggered by i2c command not through GPIO at least in our syste=
m. Power reset is
>>  being triggered though POWER_RESET gpio pin and it is supported by x86-=
power-control.
>>
>> Regards
>> -Vijay
>>
