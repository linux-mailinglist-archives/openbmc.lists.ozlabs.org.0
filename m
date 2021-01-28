Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BD2307E5D
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 19:46:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRTwJ2Hj6zDqBc
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 05:46:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::429;
 helo=mail-wr1-x429.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=qgMDguw1; dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRTmM2cr5zDsWb
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2021 05:40:02 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id v15so6461169wrx.4
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 10:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SCF0Yjv7mXBRwfRklaiSR0zALAgh5kRC12AYGDJhPbQ=;
 b=qgMDguw1+MrarFQ99aweQ+jbK6sRw5PP0UA8Q8UrbNljlCbhAxYK3sw8m/llgx94CO
 EWzebESGunAve7WFZekxI6TXgwf5bSvnMHkrdbL5fs9xdqeBf9uBIO5nsRKekw5Dmvz7
 ONAW7/8/NlVaXARD+aAPaAn93o9VSfxDEsw5MM0NkyiZVsxZag1P4w1QPIlrqOjmqc8S
 dyJHpvRuI0xU6dVri7oO1at7zkDPbFcMwMwSg19cXrIKMVkqpn+5jkrbP76S4bJgGCiM
 dq2IXUsPQPACy4iJwII1/zVPrdifKabOpxQIa3iIEUJyMrpsh4Q8EkJVwapYc9fdf9aG
 IQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SCF0Yjv7mXBRwfRklaiSR0zALAgh5kRC12AYGDJhPbQ=;
 b=Cu6oR9NZTP8wCUQlg6AIRJg+I/bTfN9dPNJdVesu208rwbBoePt9XJeXUj4XgYOkbs
 EfQZBU/AdnqqnZqBCctl7xbkOz9CxjwuQi4KC7ZFmwhTTdjZgX2pCMIBoJ+4UyBZcf31
 sTpV+yPqbT1oT4NUjRE3IlD3W+7GbKsUmrcYqHc3MQfGw3o6DvugaBPJpDIF8/hW0YAy
 ivDiizv5bijm/LR11QeV/+Mf1xXTcPNhjiRY8bdNTGk4ZvWSeR9CQFtfv665GUNSo8Mv
 Hzyrc/1DQUS7sdDaRFdMt6RNFCF89aEbhjRSJFAno5XAgz+MEqzm+4f77DltP2T0H3w5
 Hr1Q==
X-Gm-Message-State: AOAM531XPNIcVjKaOjanWUDOnBlWBCqPzipbzgFos6PvrZ9Yn/tlSgQb
 wYdSuwxikirx7jKuB/ofYC1q/AfMJipG3MRMaJPHJA==
X-Google-Smtp-Source: ABdhPJxb0HTJ8GO7fYrVWx41qTyh0HEXII8q5futWO3n2lT6swS31JHC2qcb926PHHTithf78CLFyWGLjuzdq9q4x0c=
X-Received: by 2002:a5d:49cf:: with SMTP id t15mr429992wrs.217.1611859195528; 
 Thu, 28 Jan 2021 10:39:55 -0800 (PST)
MIME-Version: 1.0
References: <TYZPR04MB441643EFC954C795DD1290A886BB0@TYZPR04MB4416.apcprd04.prod.outlook.com>
 <CAH2-KxA20CfM9upvUkB=jhapVNF4AdVROA4wafFxxYftmvwO=w@mail.gmail.com>
 <31441611827264@mail.yandex-team.ru>
In-Reply-To: <31441611827264@mail.yandex-team.ru>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 28 Jan 2021 10:39:44 -0800
Message-ID: <CAH2-KxDE0J0Q4fmYc5MvP=J+DdziCSecQHjTSJheRm7oosUdpQ@mail.gmail.com>
Subject: Re: [entity-manager] Issue about entity-manager getting stuck
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
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
 =?UTF-8?B?U2Nyb24gQ2hhbmcgKOW8teS7suW7tik=?= <scron.chang@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 28, 2021 at 1:56 AM Konstantin Klubnichkin
<kitsok@yandex-team.ru> wrote:
>
> Hello, Ed!
>
> I'm not sure if my issue is relevant to what Scron discovered, but it may=
 be.
> Sometimes (not every BMC reboot) dbus get stuck during startup.

That sounds slightly different, but certainly concerning.

> systemctl or dbus don't work (fail by timeout), services stuck trying to =
start, dbus-broker consumes a lot of CPU and dbus monitor shows storm of "P=
roperty Changed" events from anonymous application.

Can you track down which anonymous application it is?

> The work around I've found is to kill dbus-broker and dbus-broker-launch,=
 then I can at least issue "reboot" without "-f", usually (8 times out of 1=
0) BMC starts normally next time.

This doesn't really seem workable long term.

> Unfortunately I don't know how to reproduce the issue for sure. It happen=
s more often  when BMC has no network and doesn't have time source like NTP=
 or date/time saved in RTC.
> So I suspect calling busctl in a cycle is not the only way to get system =
stuck.

Lets see if we can get this debugged.  I know I haven't seen anything
similar, so I'm not sure I can be much help to you, but good luck
hunting it down.

>
> Thank you!
>
> 27.01.2021, 20:08, "Ed Tanous" <edtanous@google.com>:
>
> On Tue, Jan 26, 2021 at 10:34 PM Scron Chang (=E5=BC=B5=E4=BB=B2=E5=BB=B6=
)
> <Scron.Chang@quantatw.com> wrote:
>
>
>  Hi all,
>
>  I am using openbmc/entity-manager in this version: "f094125cd3bdbc8737dc=
8035a6e9ac252f6e8840" and I found calling Dbus makes entity-manager get stu=
ck.
>
>  Reproduce this by following steps:
>  1. systemctl stop xyz.openbmc_project.EntityManager
>  2. open another terminal and do this while-loop: "while true; do busctl =
; sleep 1; done"
>  3. systemctl start xyz.openbmc_project.EntityManager
>  I think the root cause is this function: "nameOwnerChangedMatch." (Pleas=
e refer to this line: https://github.com/openbmc/entity-manager/blob/f09412=
5cd3bdbc8737dc8035a6e9ac252f6e8840/src/EntityManager.cpp#L1859.)
>
>
> My first thought is: Don't run an empty busctl in a loop then, but I'm
> guessing that's not what you're really trying to do. If we had more
> ideas about what you were really hoping to accomplish, we might have
> some better advice for how to proceed.
>
> The intent of that code is to reconfigure entity-manager when
> interfaces are changed, so if you're constantly attaching and
> detaching to dbus, entity-manager (and object manager) never sees the
> system as "up" and keeps waiting for the system to finish stabilizing
> before it runs the config logic.
>
> In your specific case above, the code could be a little smarter, and
> ignore unique names in that check, only caring about newly-defined
> well known names, but without knowing your real use case, it's hard to
> know if that would help.
>
>
>
>  Manually calling Dbus or calling Dbus in a script makes NameOwnerChanged=
 signal and thus triggers the function: "propertiesChangedCallback" repeate=
dly. Meanwhile, the async_wait in propertiesChangedCallback gets returned b=
ecause of the operation_aborted.
>
>
> Personal opinion: Don't call busctl continuously in a script. It's
> inefficient, and causes problems like this.
>
>
>  So here is the conclusion:
>  Manually calling Dbus in a period that is less than 5 seconds leads enti=
ty-manager keeping to trigger new async_wait and abort the old one. However=
, the async_wait never gets done.
>
>  Is this a bug of entity-manager, or I get something wrong. Please help m=
e with this.
>
>
> IMO, entity-manager is working as intended, but lets try to figure out
> what you're really trying to do, and see if we can find you a
> solution.
>
>
>
>  Scron Chang
>  E-Mail Scron.Chang@quantatw.com
>
>
>
>
> --
> Best regards,
> Konstantin Klubnichkin,
> lead firmware engineer,
> server hardware R&D group,
> Yandex Moscow office.
> tel: +7-903-510-33-33
>
