Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAFB13BB6D
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 09:44:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yLV432JmzDqS6
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 19:44:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=77.238.178.180;
 helo=sonic308-44.consmr.mail.ir2.yahoo.com;
 envelope-from=max_power2005-openbmc@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=ivU2JSIQ; dkim-atps=neutral
Received: from sonic308-44.consmr.mail.ir2.yahoo.com
 (sonic308-44.consmr.mail.ir2.yahoo.com [77.238.178.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yLT96ZvdzDqRC
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2020 19:43:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1579077815; bh=35e2fH7iP1r1HqvNX6d8ZyeKP8kmDauUg7f/GdmCXaE=;
 h=Date:From:To:Subject:References:From:Subject;
 b=ivU2JSIQlSYaloIswt2HTbY79F0BgAwbLU3LYeESa5hPiAR5G7zGEsmMlEGx1IXOH9h00vv3Tnmmxb6hvEIzftn7y4u8XPZRClegZ1v3ZmM7dHSbOq1yh+8FAHvYEfMo2oQvaMuA7gq113HySjCKFxGHZ7XcyyA1H5VKuiUtzo1+tMWmlWVJBqA13eKWpjfAppoaoqBGjRHZwk1/6G9GP1iE++vltjdf5YNjIJ991KdwmuPBqsB0USAi1MCfOmg435FBmyk/uQR1vw5hEQvSMLbIADXfgT3yNnRlJtE7c5ElP/d32jaLrOP8O7V62nkDkkyPmST8AqiowyJ3hYclBA==
X-YMail-OSG: ziYHy2AVM1mxamhElFbHsTl8MEaeN_ffbODkwNhKi4uxYsFhXVFoiH85u_zY0Up
 S_JRm9zGnPB5L_7tAG27g1_yt.x8htjU358QiCtb1uzm2TmXW2P6Nzuo4iJFD0kyZQMKtcCixqlS
 otJGjIHhq2UkcezQNAuCOAKZ6dHozvei5APPhsOsqmw6FAH9v5sEj_yImRjuOxtORTxywtZYqDOc
 JWhBFfgIFtW3JG2rs5yyj4o2demdi_KCyQFJUhOfP2vrz_XzsA1gy2jGvKI4WCsAiVl.C9pWZBPb
 Fyihgzg21ybNt0B3q_CqsRvJriKG8armfy68eaaps9j51JPz4d1gEN9.rIZoG_2HUc_8dlpjYDud
 oRqJJqGVUcesnnub7Ffr03IbZJCdezj5nvUaUf_e3RkoQ46FYRpkJlcb1lTEurm8YowYW8x3ZpiY
 AY59gsbeqFIljPiEqNzpcIqed18NRdp9PJZHjoN.xIHhX9VGEexqoPVurmqgP0_SqIzdh5fozCN_
 a29f3DwzVFJFfwO.AqxjFrKKTwoapqpY9L_mg1g8yaGNzJ.W5gBQj9nN_qyguWN9Exj6x2tDjwap
 9qUHIX7iZF_nLjKNEUSECqeXXBNsNUY0FBIQCzK.QOfAa9fhfIErgcT2NeJoHe9fAuLDwz8iGvsy
 Pm3_f5l2rqgMQuiIilv82skZErSu0iAPp08Al8N.noGEXPLI00agL2BY2dkpAZUPWX9XCPJSWpGE
 Bp_ibD3q1SS30.j6xNn52R.ibjkz2zrWlq1gIUZUIFNbIFR2aZR1u2eV.LFozm_fFCd4wnncSkXk
 .z8YojHBZmIBSO42Z4jzfPU9mOSq8N6nAilUkBPUAOgAgV3AGWSFDygikBpwwVMQZ9RyGSzwN9zE
 l4Ux0ppyhtf0pwT_IqQNQaBxBES0xCqN8EDa2Grnm3b04DL.Q8aFHrSWT3NVJiM_MGIR1xTWrkPP
 9fsjA59MAi0Yj00hqv0RKSsdK8wzOl5q1rC4P6Wkz5JYNddVTQf0F.RuOkgYaKlqeERuczmPIhCJ
 TDbC9VE94McVypcLPsdbFnSYl0m6Yyma1Dn5o3DDX6skBDmz72j9fs2f7ndWNmRXXyeDtShcX3fy
 w0MB3BpoTaT6Giy6uXXmqX473hZBItkfQo9gq90J2Pefpp8vUWtbH59Yh.nxg_TaT744LTR3fOtQ
 D_bXJBQohL9WN78YXvc9_1AIgFiSjMGHj2mse0BKb.75EFXUOdVtbSBKhtdtotl0EMCl.2oPkjbG
 7LWPPpt.dqLHiz2gN.1.2bTNFJBmU_ZqkLIz0JS3VH4VOwHIUXof5ypQC_ICKEjFlDDQWXi3wrU2
 4Iw052YKYqRVSTmTHWpo-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ir2.yahoo.com with HTTP; Wed, 15 Jan 2020 08:43:35 +0000
Date: Wed, 15 Jan 2020 08:41:34 +0000 (UTC)
From: Max Power <max_power2005-openbmc@yahoo.com>
To: openbmc@lists.ozlabs.org
Message-ID: <138261238.19427827.1579077694127@mail.yahoo.com>
Subject: No sensors displayed in webUI
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <138261238.19427827.1579077694127.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.14873 YMailNodin Mozilla/5.0 (X11; Linux i686;
 rv:52.0) Gecko/20100101 Firefox/52.0 SeaMonkey/2.49.5 Lightning/5.4
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

Hi

What are the basic requirements for phosphor-webui to display the list
the available sensors?

I've create a simple entity-manager configuration for my custom hardware
containing some voltage and temp sensors definitions. All the configured
sensors are accessible under "/sys/class/hwmon/hwmon*".
"entity-manager" and "dbus-sensors" related services like "ADCSensor" or
"CPUSensor" are up and running, "busctl tree" lists all the sensors
under "/xyz/openbmc_project/sensors" and I'm able to read the sensors
properities using "busctl introspect".

But the server-health/sensors-overview page in webUI always shows 
"There are no sensors found."

Any hints or ideas what I am missing?
Do I need any other services running besides "entity-manger" and
"dbus-sensors"?

Max
