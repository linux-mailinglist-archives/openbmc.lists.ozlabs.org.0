Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 646C6671B1E
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 12:46:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxkVw2ryyz3fBm
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 22:46:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=oCnxisvW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com; envelope-from=g.semenov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=oCnxisvW;
	dkim-atps=neutral
X-Greylist: delayed 575 seconds by postgrey-1.36 at boromir; Wed, 18 Jan 2023 22:45:58 AEDT
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxkVG1Vm2z2xnK
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 22:45:58 +1100 (AEDT)
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id 65B39341942
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 14:36:16 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:content-type:content-type:date:from:from:message-id
	:mime-version:reply-to:subject:subject:to:to; s=mta-01; bh=hkt3I
	4WGyMsrDPaoXg54t4rctX9slbjlMeM2hLO7SZc=; b=oCnxisvWuyi2C9xFyxsKp
	yBS1ACi/Mlz4lLMhesX8ExRvF/Uj71hdsuQZhYRFi51tiWj813oiXYATX60Av9Od
	YrsPU0LsaU1jTtAE0zdnwVETEvUYqpf8YVGvh99VtJ1+pvyQm+UOgRG7XYnr0y1T
	955teKJ2ZiWxWtKxTtT/dU=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id 59C13341940
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 14:36:16 +0300 (MSK)
Received: from [10.199.28.51] (10.199.28.51) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Wed, 18 Jan
 2023 14:36:16 +0300
Content-Type: multipart/alternative;
	boundary="------------8IagxzhQsEoZ80LsUb5UWI6q"
Message-ID: <4fcca645-ebc3-792f-aff2-e26df9660d72@yadro.com>
Date: Wed, 18 Jan 2023 14:36:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: <openbmc@lists.ozlabs.org>
Content-Language: en-US
From: Gleb Semenov <g.semenov@yadro.com>
Subject: Add UDP transport for rsyslog
X-Originating-IP: [10.199.28.51]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
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

--------------8IagxzhQsEoZ80LsUb5UWI6q
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hello colleagues!

I'm a new member of the Yadro OBMC team and currently working on 
modifications of the phosphor logging service. Our client requested us 
to make OBMC's rsyslog to use UDP transport for remote logging. 
Currently it uses just TCP and this configuration is hard-coded.

It looks like the phosphor-rsyslog-config has only one external 
dependency, namely the sdbusplus library, which provides appropriate 
DBUS interface handler to configure network parameters. Also it needs to 
modify DBUS interface description for network client.

The following should be performed:

 1. Modification of the
    xyz/openbmc_project/Network/Client.interface.yaml interface to add
    the protocol attribute.
 2. Handling for the  interface changes in the code of the dbusplus library.
 3. Corresponding changes to the phosphor-rsyslog-config service.
 4. Proper changes to the REST/redfish API.
 5. Modification of the web interface and command line tools.

Also, current DBUS interface to the object implies two independent 
messages to change network parameters, one to set the IP-address, and 
the other to set the port number. They are not atomic and configuring 
just one parameter yields in undesirable state transitions of the 
service to configure. It is good to send all the parameters in one 
"atomic" message. But, I'm understand that this may require to persist 
current network parameters on both sides of transmission (or, at least, 
to have all of them on sending side upfront).

So, it needs to add  DBUS getters/setters for just protocol type, and 
all parameters at once.

I'm interested in what other components may be affected by such 
improvements?

Your comments will be appreciated.

Regards!

Gleb

--------------8IagxzhQsEoZ80LsUb5UWI6q
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello colleagues!<br>
    </p>
    <p>I'm a new member of the Yadro OBMC team and currently working on
      modifications of the phosphor logging service. Our client
      requested us to make OBMC's rsyslog to use UDP transport for
      remote logging. Currently it uses just TCP and this configuration
      is hard-coded. </p>
    <p>It looks like the phosphor-rsyslog-config has only one external
      dependency, namely the sdbusplus library, which provides
      appropriate DBUS interface handler to configure network
      parameters. Also it needs to modify DBUS interface description for
      network client.</p>
    <p>The following should be performed:</p>
    <ol>
      <li>Modification of the
        xyz/openbmc_project/Network/Client.interface.yaml interface to
        add the protocol attribute.</li>
      <li>Handling for the  interface changes in the code of the
        dbusplus library.</li>
      <li>Corresponding changes to the phosphor-rsyslog-config service.</li>
      <li>Proper changes to the REST/redfish API.</li>
      <li>Modification of the web interface and command line tools.</li>
    </ol>
    <p>Also, current DBUS interface to the object implies two
      independent messages to change network parameters, one to set the
      IP-address, and the other to set the port number. They are not
      atomic and configuring just one parameter yields in undesirable
      state transitions of the service to configure. It is good to send
      all the parameters in one "atomic" message. But, I'm understand
      that this may require to persist current network parameters on
      both sides of transmission (or, at least, to have all of them on
      sending side upfront).</p>
    <p>So, it needs to add  DBUS getters/setters for just protocol type,
      and all parameters at once.</p>
    <p>I'm interested in what other components may be affected by such
      improvements?</p>
    <p>Your comments will be appreciated.</p>
    <p>Regards!</p>
    <p>Gleb<br>
    </p>
    <p></p>
  </body>
</html>

--------------8IagxzhQsEoZ80LsUb5UWI6q--

