Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B272461FF7F
	for <lists+openbmc@lfdr.de>; Mon,  7 Nov 2022 21:25:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5jQz3lYdz3cDp
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 07:25:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=quk0BI22;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=quk0BI22;
	dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5jQN0qgNz2xGq
	for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2022 07:24:58 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46-20020a9d0631000000b00666823da25fso7246878otn.0
        for <openbmc@lists.ozlabs.org>; Mon, 07 Nov 2022 12:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxmHBBtgmXPGBNAhMtyFvN3+yAC+oVsAHF3KAw2nY+I=;
        b=quk0BI22NeYHpXcfHRQIZA+xQTfXPek2qkLM6Bjvw97haVnFw4+6qIb2jUH4SCE/L9
         hqByJU14RX3BcFufZbZXwMU5H/Ugj9CufZkA+7XH+K8Y3yE72anv+7NNvRrSK3F3L94J
         BK6Bz1Px39P7UG2MB7G+Mm164rqBChSxXmfqf6EDxazS78bg0tpVXBFW0C6m8ZQk9OJk
         pI9e5B8pPQKSIM70Y3CA0m/cTjTY/xH+zyilkdzc+gseEUp1ZFat1k/383Q004eM2/K3
         YuTiL1nMqWkjtmlaWzy9dcdIqi5/jwG1TsFfl1XmQuOz3We+56bL3udkBq6EPi+98KVZ
         nLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxmHBBtgmXPGBNAhMtyFvN3+yAC+oVsAHF3KAw2nY+I=;
        b=xUZmbtcqmQ01mUxXOFZwWrlvd4Td58Dx+TZ+iBAH59gVjyB6CaLcdTxgeXzFZ0sMqU
         vx2qlkavJOR2rC6liMedM8i7VfVMwyuzA/vUN19udJQnj9sECNgs5OnrGmPku4IUM8Xk
         V5aJeUfkfPjf9WpywHm30svLG/Dp4zInD/zkmp40Vcf6oEWZVJBaaQUV6sdnmBWxQ7OW
         XfAILpeOjjpJsXQSbdZSrjOb6z6nVZ/VteN6qSqS4BwmnZD607Hz0uwJ1TfTvWU/iKDP
         xqmW5kJqY6qZdcwkulwIVJwfNQe4chscHuGC7TPS2UFNe24+ehh85ZjQ0fBZJn0RRDgG
         JeIw==
X-Gm-Message-State: ACrzQf03GstyuebX7eBTA0OzaC4nK00YtrEjX651it1V4hEuS/hpdm4j
	yYUZuLdqNKsQdhs/d1xCX1tw6jPP//c=
X-Google-Smtp-Source: AMsMyM7tm8dOehEptfd/vUGbYaCd+ECXVTnJO+fMk8UKJPqq0sPmNHirO31CMeX0hK0ldeNGGkrVOw==
X-Received: by 2002:a9d:7546:0:b0:66c:7d26:e6e7 with SMTP id b6-20020a9d7546000000b0066c7d26e6e7mr13853340otl.218.1667852693413;
        Mon, 07 Nov 2022 12:24:53 -0800 (PST)
Received: from smtpclient.apple ([136.49.194.28])
        by smtp.gmail.com with ESMTPSA id h8-20020aca3a08000000b0035474ff66b3sm2800582oia.35.2022.11.07.12.24.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Nov 2022 12:24:52 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Phosphor State Manager Does Not Work as Expected
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <006e01d8f289$d5518340$7ff489c0$@inventron.com.tr>
Date: Mon, 7 Nov 2022 14:24:52 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <02207246-43E3-4B13-A49F-4C3E58B82A0C@gmail.com>
References: <006e01d8f289$d5518340$7ff489c0$@inventron.com.tr>
To: zehra.ozdemir@inventron.com.tr
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: openbmc@lists.ozlabs.org, "M. Erhan Yigitbasi" <erhan.yigitbasi@inventron.com.tr>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Nov 7, 2022, at 3:18 AM, zehra.ozdemir@inventron.com.tr wrote:
>=20
> Hello,
> We are trying to implement phosphor-state-manager to our projects to =
control the host. Logs are given down below when we trigger the =
immediate option from GUI:=20
> =20
> Nov 07 08:53:19 Aselsan-Server phosphor-chassis-state-manager[404]: =
Change to Chassis Requested Power State: =
xyz.openbmc_project.State.Chassis.Transition.Off

This looks like someone is requesting a poweroff during a power on. This =
fact op-reset-chassis-on@0.service was running indicates the powerreset =
logic was running (chassis power was detected to be on after a BMC reset =
so the services are getting the system into the correct state to match =
that before the poweroff request comes in)

> Nov 07 08:53:20 Aselsan-Server systemctl[415]: Job for =
obmc-chassis-poweron@0.target canceled.
> Nov 07 08:53:20 Aselsan-Server systemd[1]: =
op-reset-chassis-on@0.service: Main process exited, code=3Dexited, =
status=3D1/FAILURE
> Nov 07 08:53:20 Aselsan-Server systemd[1]: =
op-reset-chassis-on@0.service: Failed with result 'exit-code'.
> Nov 07 08:53:20 Aselsan-Server systemd[1]: Stopped Start chassis0 on =
after BMC reset.
> Nov 07 08:53:20 Aselsan-Server systemd[1]: Created slice Slice =
/system/obmc-led-group-stop.
> Nov 07 08:53:20 Aselsan-Server systemd[1]: Created slice Slice =
/system/op-power-stop.
> Nov 07 08:53:20 Aselsan-Server systemd[1]: Created slice Slice =
/system/op-powered-off.
> Nov 07 08:53:20 Aselsan-Server systemd[1]: Created slice Slice =
/system/op-wait-power-off.
> Nov 07 08:53:20 Aselsan-Server systemd[1]: Created slice Slice =
/system/phosphor-clear-one-time.
> Nov 07 08:53:20 Aselsan-Server systemd[1]: Created slice Slice =
/system/phosphor-reset-sensor-states.
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Created slice Slice =
/system/phosphor-set-host-transition-to-off.
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Stopped target Host0 =
running after reset.
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Stopped target Power0 (On).
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Stopped target Chassis0 =
power on after reset.
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Stopped target Power0 On =
(Starting).
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Stopped target Power0 On =
(Pre).
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Stopped target Multi-User =
System.
> Nov 07 08:53:21 Aselsan-Server phosphor-bmc-state-manager[372]: =
BMC_READY
> Nov 07 08:53:21 Aselsan-Server phosphor-bmc-state-manager[372]: =
Setting the BMCState field to =
xyz.openbmc_project.State.BMC.BMCState.Ready
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Stopped target Chassis0 =
(Reset Check).
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Stopped target Host0 (Reset =
Check).
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Starting Wait for =
/xyz/openbmc_project/control/host0/auto_reboot/one_time...
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Reset host sensors was =
skipped because of a failed condition check =
(ConditionPathExists=3D!/run/openbmc/host@0-on).
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Starting Set host state to =
transition to off...
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Finished Wait for =
/xyz/openbmc_project/control/host0/auto_reboot/one_time.
> Nov 07 08:53:21 Aselsan-Server phosphor-host-state-manager[424]: =
Change to Host State: =
xyz.openbmc_project.State.Host.HostState.TransitioningToOff
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Starting Reset one-time =
properties on chassis off...
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Finished Set host state to =
transition to off.
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Reached target Stop Host0 =
(Pre).
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Reached target Host0 =
(Stopping).
> Nov 07 08:53:21 Aselsan-Server systemd[1]: Reached target Host0 =
(Stopped).
> Nov 07 08:53:22 Aselsan-Server systemd[1]: Reached target Power0 Off =
(Pre).
> Nov 07 08:53:22 Aselsan-Server systemd[1]: Started Stop Power0.
> Nov 07 08:53:22 Aselsan-Server systemd[1]: Starting Wait for Power0 to =
turn off...
> Nov 07 08:53:22 Aselsan-Server systemd[1]: =
phosphor-clear-one-time@0.service: Deactivated successfully.
> Nov 07 08:53:22 Aselsan-Server systemd[1]: Finished Reset one-time =
properties on chassis off.
> =20
> =20
> After that, neither Chassis State nor Host State is off. The Chassis =
State is On and the Host State is TransitioningToOff. Could you please =
give us some information about what could have caused this condition? =20=


PSM will mark the chassis off when the obmc-chassis-poweroff@0.target =
completes and the host off when the obmc-host-stop@0.target completes. =
It=E2=80=99s up to you to put the correct services in those targets to =
do the actual host shutdown and chassis power off for your system. If =
the states are not changing then you must have some services in those =
targets that are not completing.

You can do things like =E2=80=9Csystemctl =E2=80=94list-jobs=E2=80=9D to =
try and see which one=E2=80=99s are hanging up. Or just go into =
/lib/systemd/system/ and look at the services =
(obmc-chassis-poweroff@0.target.wants/requires)


