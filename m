Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0E36E27D5
	for <lists+openbmc@lfdr.de>; Fri, 14 Apr 2023 18:00:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pyh3g1t0Hz3fWV
	for <lists+openbmc@lfdr.de>; Sat, 15 Apr 2023 01:59:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventron.com.tr header.i=@inventron.com.tr header.a=rsa-sha256 header.s=default header.b=rnTVa1jB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inventron.com.tr (client-ip=185.216.113.71; helo=ns1.ihsdnsx51.com; envelope-from=tunc.doygun@inventron.com.tr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventron.com.tr header.i=@inventron.com.tr header.a=rsa-sha256 header.s=default header.b=rnTVa1jB;
	dkim-atps=neutral
X-Greylist: delayed 397 seconds by postgrey-1.36 at boromir; Sat, 15 Apr 2023 01:59:24 AEST
Received: from ns1.ihsdnsx51.com (ns1.ihsdnsx51.com [185.216.113.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyh302MGjz3fT6
	for <openbmc@lists.ozlabs.org>; Sat, 15 Apr 2023 01:59:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inventron.com.tr;
	s=default; t=1681487960;
	bh=/ZFnaQ6JCTMZCo/AlRJ2lUClChV5TSic3uuyohpyl+s=;
	h=Received:Received:To:From:Subject;
	b=rnTVa1jBVq/NhO833Ng3MDFeZQiXDAf40/etOx4aTCkvFQgsXNK8nTRBDbrATAmqT
	 ioD2uUwKJcsolsaXBJUzKjvXNmbcAQE48tKuc1+88VBIwjZe8yPuEBWCEtfNfv2/qE
	 NmXC7kyoaUjXUn9wPSOupzRulg1L0l5kZhI/QjDI=
Received: (qmail 710761 invoked from network); 14 Apr 2023 18:52:39 +0300
Received: from 78.189.148.199.static.ttnet.com.tr (HELO ?192.168.1.37?)
 (78.189.148.199)
  by ns1.ihsdnsx51.com with ESMTPSA (AES128-GCM-SHA256 encrypted,
 authenticated); 14 Apr 2023 18:52:38 +0300
Content-Type: multipart/alternative;
 boundary="------------ZeV42FIYBhLKM0LjCHNhXZig"
Message-ID: <cc8b520e-b0b1-66df-d5c4-84931f4a1f8c@inventron.com.tr>
Date: Fri, 14 Apr 2023 18:52:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: openbmc@lists.ozlabs.org
Content-Language: en-US
From: Tunc Doygun <tunc.doygun@inventron.com.tr>
Subject: smbios-mdrv1
X-PPP-Message-ID: <168148755901.710750.3449336563857137946@ns1.ihsdnsx51.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------ZeV42FIYBhLKM0LjCHNhXZig
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

We are trying to communicate BMC with bios that supports smbios-mdrv1. 
We have built the mdrv1 code in Intel's 
https://github.com/Intel-BMC/provingground/tree/master/services/smbios 
repo in yocto.We included intel-ipmi-oem project into image. We enabled 
kcs3 0xCA2 in dts. But we could not communicate. Is there anything else 
we should do?

intel-ipmi-oem logs:

Apr 14 15:33:50 ipmid[383]: Registering OEM commands
Apr 14 15:33:51 ipmid[383]: BIOSConfig module initialization
Apr 14 15:33:51 ipmid[383]: Registering MultiNode commands
Apr 14 15:33:52 ipmid[383]: Registering Chassis commands
Apr 14 15:33:52 ipmid[383]: Loading whitelist filter
Apr 14 15:33:57 ipmid[383]: Unable to find SMM Channel Info
Apr 14 15:33:57  ipmid[383]: Could not initialize provisioning mode, 
defaulting to restricted
Apr 14 15:33:58  ipmid[383]: Error in OperatingSystemState Get
Apr 14 15:33:58  ipmid[383]: No Object has implemented the interface
Apr 14 15:33:58  ipmid[383]: The operation failed internally.
Apr 14 15:33:58  ipmid[383]: Could not initialize CoreBiosDone, 
coreBIOSDone asserted as default
Apr 14 15:33:58  ipmid[383]: New interface mapping
Apr 14 15:33:58  ipmid[383]: Set restrictedMode = false
Apr 14 15:33:58  ipmid[383]: New interface mapping

ipmid logs:

Apr 14 15:48:21  ipmid[382]: Legacy Handler failed to catch exception
Apr 14 15:48:23  ipmid[382]: Get Sol Config - Invalid channel in request
Apr 14 15:48:24  ipmid[382]: Get Sol Config - Invalid channel in request
Apr 14 15:48:25  ipmid[382]: Get Sol Config - Invalid channel in request
Apr 14 15:48:26  ipmid[382]: Get Sol Config - Invalid channel in request

--------------ZeV42FIYBhLKM0LjCHNhXZig
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span
            class="ryNqvb">We are trying to communicate BMC with bios
            that supports smbios-mdrv1. We have built the mdrv1 code in
            Intel's
            <a class="moz-txt-link-freetext" href="https://github.com/Intel-BMC/provingground/tree/master/services/smbios">https://github.com/Intel-BMC/provingground/tree/master/services/smbios</a>
            repo in yocto.</span></span><span class="jCAhz ChMk0b"><span
            class="ryNqvb">We included intel-ipmi-oem project into
            image. We enabled kcs3 0xCA2 in dts. But we could not
            communicate. Is there anything else we should do?</span></span></span></p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span
            class="ryNqvb">intel-ipmi-oem logs:</span></span></span></p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span
            class="ryNqvb">Apr 14 15:33:50 ipmid[383]: Registering OEM
            commands<br>
            Apr 14 15:33:51 ipmid[383]: BIOSConfig module initialization<br>
            Apr 14 15:33:51 ipmid[383]: Registering MultiNode commands<br>
            Apr 14 15:33:52 ipmid[383]: Registering Chassis commands<br>
            Apr 14 15:33:52 ipmid[383]: Loading whitelist filter<br>
            Apr 14 15:33:57 ipmid[383]: Unable to find SMM Channel Info<br>
            Apr 14 15:33:57  ipmid[383]: Could not initialize
            provisioning mode, defaulting to restricted<br>
            Apr 14 15:33:58  ipmid[383]: Error in OperatingSystemState
            Get<br>
            Apr 14 15:33:58  ipmid[383]: No Object has implemented the
            interface<br>
            Apr 14 15:33:58  ipmid[383]: The operation failed
            internally.<br>
            Apr 14 15:33:58  ipmid[383]: Could not initialize
            CoreBiosDone, coreBIOSDone asserted as default<br>
            Apr 14 15:33:58  ipmid[383]: New interface mapping<br>
            Apr 14 15:33:58  ipmid[383]: Set restrictedMode = false<br>
            Apr 14 15:33:58  ipmid[383]: New interface mapping<br>
          </span></span></span></p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span
            class="ryNqvb">ipmid logs:</span></span></span></p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span
            class="ryNqvb">Apr 14 15:48:21  ipmid[382]: Legacy Handler
            failed to catch exception<br>
            Apr 14 15:48:23  ipmid[382]: Get Sol Config - Invalid
            channel in request<br>
            Apr 14 15:48:24  ipmid[382]: Get Sol Config - Invalid
            channel in request<br>
            Apr 14 15:48:25  ipmid[382]: Get Sol Config - Invalid
            channel in request<br>
            Apr 14 15:48:26  ipmid[382]: Get Sol Config - Invalid
            channel in request<br>
            <br>
          </span></span></span></p>
  </body>
</html>

--------------ZeV42FIYBhLKM0LjCHNhXZig--
