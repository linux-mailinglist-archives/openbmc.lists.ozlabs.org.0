Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C9E1E944E
	for <lists+openbmc@lfdr.de>; Sun, 31 May 2020 00:38:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ZGYM724RzDqfH
	for <lists+openbmc@lfdr.de>; Sun, 31 May 2020 08:38:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.23;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=fabian@knogle.industries;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=knogle.industries
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=knogle.industries header.i=@knogle.industries
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=MfaHGJLL; 
 dkim-atps=neutral
X-Greylist: delayed 356 seconds by postgrey-1.36 at bilbo;
 Sun, 31 May 2020 08:37:34 AEST
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.23])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ZGXZ0HQLzDqk7
 for <openbmc@lists.ozlabs.org>; Sun, 31 May 2020 08:37:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1590878249;
 s=strato-dkim-0002; d=knogle.industries;
 h=Date:Message-ID:Subject:From:To:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=KarLNlk+MwWnjDOju9+nXuOhn6VxWiewrPqgVQ8uoD0=;
 b=MfaHGJLLMq1iKgeeGm4P9Z3Ps+v891qF/SAlOrrGUcQAXXbSjaeuYbkc8UMGKrZelB
 YJQG4Q4hORmix20YfeZLEt1Tz63cbLHhotGayiIqyUIMOLytcPBJYeUOHGborf3TSTvJ
 Pkax3YNVt4VOCRAepomCpEVjX6uPY3cHTT1HjtYWTuXCtplofbGZKdfImExkGsthDbdS
 00UF63ViuLFIjMmJ5hwoEjXn4fgsaYs1ngJt3s0XuPEYh8Rl/K7RW3d5zubdUJosaFsu
 G/ylJcautQi5pmYuEy/lpjoO5vgz+uOd7WVGYIZ/U+FyoZJ5PqzT5Mz5E91+7cjBPxbg
 AQkQ==
X-RZG-AUTH: ":Km0GfEGmW/TiQgLaTjxkbEgAG+L5On5w0UduP9EjyAiQ0JmBMLEAqF9JBLUTb269C8LpHuFXSsZ6l76hPy6Dc0KnuihiGsD0IXScDK6xlZVo"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:4dd0:4ed6:0:f141:b3df:154c:f747]
 by smtp.strato.de (RZmta 46.9.0 AUTH) with ESMTPSA id e0b581w4UMVRCE0
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <openbmc@lists.ozlabs.org>;
 Sun, 31 May 2020 00:31:27 +0200 (CEST)
To: openbmc@lists.ozlabs.org
From: Fabian Druschke <fabian@knogle.industries>
Subject: =?UTF-8?Q?Winbond=c2=ae_/_Nuvoton_WPCM450_BMC_Support=3f?=
Message-ID: <7892f8e4-805a-7e97-80d2-088210c719f7@knogle.industries>
Date: Sun, 31 May 2020 00:31:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------97627F2569C6FD5FAD0A1987"
Content-Language: en-US
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
--------------97627F2569C6FD5FAD0A1987
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Ahoy friends.

Currently i'm doing server part remarketing, and we got huge amounts of 
Supermicro X8DTX and X9DRX boards.

All of them use the Winbond® WPCM450 BMC, but providing outrageous 
support by Supermicro, which is making it almost useless.

Many people use these boards, because they are affordable (Socket 1366, 
and Socket 2011) for many people, and they are still in use by a huge 
amount of people.

Unfortunately there is no alternative to the Supermicro BMC, but i found 
some sources regarding the BMC on the Supermicro GPL page (maybe it 
might help?).

I'm also a user of X8DTU-F and X9DRI-F and i'd be happy about support of 
this chip.

Is there a way to port it to this chip, or is it more complicated? (Or 
maybe planned for future releases?).

I'd also like to donate boards, because i got a huge amount of them in 
stock.


Thanks in advance!


--------------97627F2569C6FD5FAD0A1987
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Ahoy friends.</p>
    <p>Currently i'm doing server part remarketing, and we got huge
      amounts of Supermicro X8DTX and X9DRX boards.</p>
    <p>All of them use the Winbond® WPCM450 BMC, but providing <span
        class="tlid-translation translation" lang="en"><span title=""
          class="">outrageous support by Supermicro, which is making it
          almost useless.</span></span></p>
    <p><span class="tlid-translation translation" lang="en"><span
          title="" class="">Many people use these boards, because they
          are affordable (Socket 1366, and Socket 2011) for many people,
          and they are still in use by a huge amount of people.</span></span></p>
    <p><span class="tlid-translation translation" lang="en"><span
          title="" class="">Unfortunately there is no alternative to the
          Supermicro BMC, but i found some sources regarding the BMC on
          the Supermicro GPL page (maybe it might help?).</span></span></p>
    <p><span class="tlid-translation translation" lang="en"><span
          title="" class="">I'm also a user of X8DTU-F and X9DRI-F and
          i'd be happy about support of this chip.</span></span></p>
    <p><span class="tlid-translation translation" lang="en"><span
          title="" class="">Is there a way to port it to this chip, or
          is it more complicated? (Or maybe planned for future
          releases?).<br>
        </span></span></p>
    <p><span class="tlid-translation translation" lang="en"><span
          title="" class="">I'd also like to donate boards, because i
          got a huge amount of them in stock.</span></span></p>
    <p><span class="tlid-translation translation" lang="en"><span
          title="" class=""><br>
        </span></span></p>
    <p><span class="tlid-translation translation" lang="en"><span
          title="" class="">Thanks in advance!<br>
        </span></span></p>
  </body>
</html>

--------------97627F2569C6FD5FAD0A1987--
