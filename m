Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCA7753F84
	for <lists+openbmc@lfdr.de>; Fri, 14 Jul 2023 18:08:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventron.com.tr header.i=@inventron.com.tr header.a=rsa-sha256 header.s=default header.b=U90l+JFe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2bxw3knvz3c86
	for <lists+openbmc@lfdr.de>; Sat, 15 Jul 2023 02:08:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventron.com.tr header.i=@inventron.com.tr header.a=rsa-sha256 header.s=default header.b=U90l+JFe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inventron.com.tr (client-ip=185.216.113.71; helo=ns1.ihsdnsx51.com; envelope-from=zehra.ozdemir@inventron.com.tr; receiver=lists.ozlabs.org)
X-Greylist: delayed 395 seconds by postgrey-1.37 at boromir; Sat, 15 Jul 2023 02:08:17 AEST
Received: from ns1.ihsdnsx51.com (ns1.ihsdnsx51.com [185.216.113.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2bxF2D4Bz30PQ
	for <openbmc@lists.ozlabs.org>; Sat, 15 Jul 2023 02:08:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inventron.com.tr;
	s=default; t=1689350893;
	bh=I7pKc/uQVD0wtST0rfhX+hyixpsiCzp8ms1vjm9I2hw=;
	h=Received:Received:To:From:Subject;
	b=U90l+JFeodvwLmWgR4LuGy+15xqxsgKxRa9CX+XKuRNgNuL6ge1/L5SvBRHJGAQh1
	 SzyGCnFuhTXUXO2bSP7ToxfBuiOKegqOFLg0KewSReGwahS2fu9WJPs9mHwM3D4bwG
	 r8kzX30vDYtzQIbCc4OtDB0K3nnHQSrbYB1ou0NU=
Received: (qmail 1841173 invoked from network); 14 Jul 2023 19:01:32 +0300
Received: from 78.189.148.199.static.ttnet.com.tr (HELO ?192.168.1.91?)
 (78.189.148.199)
  by ns1.ihsdnsx51.com with ESMTPSA (AES128-GCM-SHA256 encrypted,
 authenticated); 14 Jul 2023 19:01:32 +0300
Message-ID: <2a926d1f-2f3b-6608-d32c-7d56f7440e25@inventron.com.tr>
Date: Fri, 14 Jul 2023 19:01:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: openbmc@lists.ozlabs.org
From: Zehra Ozdemir <zehra.ozdemir@inventron.com.tr>
Subject: Polling Host state
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID:  <168935049292.1841159.17506443537887774875@ns1.ihsdnsx51.com>
X-PPP-Vhost: inventron.com.tr
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
Cc: "M. Erhan Yigitbasi" <erhan.yigitbasi@inventron.com.tr>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello to all,

When we try to shutdown the host over its operationg system, we saw that 
host-state-manager does not detect the pin signal and does not change 
the CurrentHostState property of xyz.openbmc_project.State.Host dbus 
interface. As far as we have looked through the source code of state 
manager, we have not been able to find a polling method for host state. 
There is just only one method called by scanGpioPin in 
host_condition_main.cpp which controls host pin signal by using 
gpio-line in dtb to write host's situation to CurrentFirmwareCondition 
value of xyz.openbmc_project.State.HostCondition.Gpio dbus interface. 
However, there is no polling to change host state for this 
CurrentFirmwareCondition value,  that can be triggered without using 
bmcweb or buttons .

Also there is obmc-op-control-power project to for polling pgood pin 
which is defined in  gpio_defs.json to  controls the pgood property of 
org.openbmc.control.Power interface for chassis-state-manager. If host 
is off, pgood is also 0. So we patched this project in poll_pgood method 
by using sd_bus methods of libsystemd-dev. When poll_pgood method 
detects pgood value as off, we control the the current state value of 
the host and if they are not parallel with each other, we set the host 
state and it seems to work correctly.

Could you please give us some information about if there is any proper 
implementation which we missed to detect host state by polling host pin 
signal or not?

