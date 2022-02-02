Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1164A6C7C
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 08:52:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpYss6zM6z3bTP
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 18:52:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OigZqQOH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::134;
 helo=mail-il1-x134.google.com; envelope-from=suichen6@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OigZqQOH; dkim-atps=neutral
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpYsR4Xkgz2yLg
 for <openbmc@lists.ozlabs.org>; Wed,  2 Feb 2022 18:51:38 +1100 (AEDT)
Received: by mail-il1-x134.google.com with SMTP id z4so16359227ilz.4
 for <openbmc@lists.ozlabs.org>; Tue, 01 Feb 2022 23:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=DK+qBP5w4KvcCSFEadXjl4eTMiNGD5yyNYNMC/oHpyk=;
 b=OigZqQOHbt+QmLoHWi7FbkRjwT4y5B/jixLZTCMeduu2KhynYo3fW9FBcNwTW15y0y
 WrevMJT+qlrOvnveNMyZ++FRJW+CMsbxj31a8nXamuzD8omk3FZfH1Gmj5Pq5QjN95B+
 RYkH77vLA14Oqp5N14ThNe299VDuUMCkZW5KL6HDkCyNpXHuOqEo7IsQtmKwBnep4Qos
 isy6w1HqN7axi6mgonk9Tz3nwlGCwe6xG/VAerrstw3+oW2MlebRCZcqLInDburYEIn3
 aC8kl6nQZkT2W1Oa0eh3Fze5tbRzqwpgkb90T9KUq4PywgFFQKN5auizOvctaWAWCIdR
 lolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DK+qBP5w4KvcCSFEadXjl4eTMiNGD5yyNYNMC/oHpyk=;
 b=dZ5271n/sJwCWlHzHAkfCuAgobieJsQ75VrYGPrNHEVBhHwq8zyCFlxIVCaPsBQ2Yg
 iLuGBrpGgykotwiDW6wJ54zxVTBHYiJpBbgXHp/0a1rBwsLHyrXPzW/KRDK2E4i/btgD
 OpCkuoLgpx8OTUqZxx9anlHXocQGZulWvnMmWYNUh6Bxh6RdIPpkUJxEoLfA9yoHLkn+
 xPbWgLNWFJR2V8NjreicELM6AeCXCZel2/admuVapIlo3RNk77wCuzlLlM/7ExktEooc
 hX9wVC5r0A7zWR5D9LKxI+cPoWgdlExPWVHVGP3TJ9+H0es5LHSIB3BTf9io9I+EDfTh
 OKQg==
X-Gm-Message-State: AOAM533NAL5YANIQmMCjSgKCPUPMox0uV+zydXRSlVPcaK0WqUGjbvrq
 FIQuraWoKpMN870o7pDml0euwo9zSbpxLa+b7YnCf8DlPiu8Xg==
X-Google-Smtp-Source: ABdhPJxoZjgZdqvxk9AwVIwLXbKveU8+irZQN1m5NSA2BvpRXttd8ewe+ZGE0kciqoAXyiyQDRwyBjpCWISFhBUZKfU=
X-Received: by 2002:a92:c569:: with SMTP id b9mr12011888ilj.132.1643788295196; 
 Tue, 01 Feb 2022 23:51:35 -0800 (PST)
MIME-Version: 1.0
From: Sui Chen <suichen6@gmail.com>
Date: Tue, 1 Feb 2022 23:51:23 -0800
Message-ID: <CAFaEeaFP1pzXCU6J12hQSrAx=BQdbUHpk8tOSNrO-LA+ROcm6w@mail.gmail.com>
Subject: "dbus-top" tool update: sensor associations and I2C stats
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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

Hello, OpenBMC,

This is an update to the work-in-progress "dbus-top" tool:

In the screenshot below, the bottom-left window shows sensor objects
as well association edges they're involved in; the bottom-right window
shows I2C transactions (the user can choose to show different columns
too) performed by each of the processes sending DBus messages.

This tool is in progress so some improvement still needs to be done.
If interested, you can try it by cloning this change (or the latest
change in its chain) and adding the BitBake recipes in there:
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/50856/

(The screenshot is manually squashed to fit into a 70-character column
width. A console window is recommended when actually running the tool
on a BMC.)

+-----------------------------------------------------------------+
|Message Type  msg/s |Method Call (us) Hist|History  (Total msg/s)|
|Method Call   11.26 |  7553-:             |                 -900 |
|Method Return 11.26 |   810-::.  .        |      :      .   -675 |
|Signal        69.05 |    86-:::::::..::...|      :      :   -450 |
|Error          0.00 |     9-::::::::::::::|. ::  :.  :.::.  -225 |
|Total         91.58 |1%-99% 56.00  85321.0|:::::::::::::::::-0   |
+----------------------------------+------------------------------|
| Details of fan0_tach Sensor 3/123| Sender CMD           I2C Tx/s|
|                                  | /usr/bin/externals...        |
| There are 1 sensors with the name| /usr/bin/fansensor    470.13 |
|                                  | /usr/bin/cpusensor           |
| DBus Service    : xyz.openbmc_pr | phosphor-watchd --...        |
| DBus Connection : :1.238         | /usr/bin/hwmontemp...        |
| DBus Object Path: /xyz/openbmc_p | /usr/bin/psusensor    13584.3|
| fanX_tach                        | ipmid                        |
|                                  | ipmid                        |
|                                  | ipmid                        |
| Association status:              | /usr/libexec/kcsbr...        |
| Used as Forward vertex 1 times:  |                              |
| 1. /chassis (1)                  |                              |
|   /xyz/openbmc_project/invent... |                              |
|   chassis                        |                              |
|                                  |                              |
| Used as reverse vertex 1 times:  |                              |
| 1. /all_sensors (1)              |                              |
|   /xyz/openbmc_project/invent... |                              |
|   all_sensors                    |                              |
|                                  |                              |
|                                  |                              |
+----------------------------------+------------------------------+
 Wed Jan  7 06:34:47 1970        Press [Tab] to cycle through views


Personally, I didn't have much background in embedded development in
general, and this tool helped me climb OpenBMC's learning curve a bit.
Hopefully it might be useful for others to learn OpenBMC and for
debugging too.
Any comments are greatly welcome and appreciated.

Thanks!
