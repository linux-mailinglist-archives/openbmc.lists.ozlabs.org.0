Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5285BC4FB
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 11:06:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWJhQ3KVCz30Lb
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 19:06:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TrYCbqHA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com; envelope-from=liuxiwei1013@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TrYCbqHA;
	dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWJgz41KPz2xH9
	for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2022 19:06:22 +1000 (AEST)
Received: by mail-lf1-x142.google.com with SMTP id k10so45838752lfm.4
        for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2022 02:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=6CnXZynH4WfWYydefrjp3czAqOmNot8X+c6zFSDc1iY=;
        b=TrYCbqHAa+QdgVORi/gVPtDNn0XwGh16gYPig/wOjq28L6t9xD9IaFZ6lNMvFDgf/1
         Iab9biWh7pNfwxGOzvrEJpE4s09oNyV0U/cOQUdgH2zeHZViCcsp3t1nhYJ/EfwGy/t+
         yDyE5Wo6x38on7kd7lrtNQuiWCYKrZRmPAoizs4c6JrwlxDaOp2DTfzwO3NxvxQq7oaX
         3I3KBM8mzhVVwcyoub8D3DAaY+LFuWCTxM/WbV3THg8f07t2tpKxL92x305gpxfYojRz
         MpmmkkOYnVyOefSQnka1qDpkF5dRPvmpqsFx73vYky2JI6tVbpyO3E/aLpNTgjyuykIw
         JBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=6CnXZynH4WfWYydefrjp3czAqOmNot8X+c6zFSDc1iY=;
        b=xdEzuT70KYRRYcrQPlenq4P02lsYKwWOlEX/zZAT7W7dRkrhpM3qQ3YqD9wjVBhTmf
         pO+LZ1z4YRDYsv2+Qj9WQBbSLuFumA7lp/0mzTpXJu8u4PsmBuV18SHf0WVjKbarKURg
         0OD7F7xJhsDzCjLLJQLpL3I69/CcQq+R6A3sNEaijinSpIfq6px/3yu+9ZEx2yUMKFrz
         47Kn41vPRRpw0pVJrfqFkYZAtIxCmWOZygLbzEaQzvlKLZWqfOWDnypjtMkz0rj+Nqev
         JC2qpUwN8PpUHlhd666ciUfwBhtpaNpV4tPkg5uIKaOqEXVuHNqhN0tP6/lGitMl9jN+
         RSEw==
X-Gm-Message-State: ACrzQf3GNBW7zk6NHYaqB/oxxGThUmMaeq02WHsx0wanHTbw4KSxzrfM
	4F2M4Efmlm/Bp4JXpf7Mk4A3mAL/Qg7DrPKFF9p6gzzMQkY=
X-Google-Smtp-Source: AMsMyM7yVkVA0Nh2Rjjcvf3UHI/XCQ9u7FJIpWwee9bon9FaYM+VJxeEvfyNorh/sW+LvJwJdCyn43EK0PB0y6Qfeu8=
X-Received: by 2002:a05:6512:3d17:b0:497:9e34:94f2 with SMTP id
 d23-20020a0565123d1700b004979e3494f2mr5582198lfv.285.1663578376015; Mon, 19
 Sep 2022 02:06:16 -0700 (PDT)
MIME-Version: 1.0
From: George Liu <liuxiwei1013@gmail.com>
Date: Mon, 19 Sep 2022 17:06:04 +0800
Message-ID: <CANFuQ7DkAwQqLZoOMPmTURUWDdk=Kfx1xTFN2jE9VQQH-wmhSA@mail.gmail.com>
Subject: Whether to allow setting time in NTP mode
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

Hey, everyone:

  This email would like to discuss whether to allow the requirement to
set the time when NTP is enabled.

  In the phosphor-time-manager, The current design logic is:
  1. The timeManager will listen to the TimeSyncMethod property of the
xyz.openbmc_project.Time.Synchronization interface to set the SetNTP
method of timedate1 and update the current Time mode. [1]
  2. When the user changes the time using OOB, the timeManager does
not verify the current Time mode, and directly calls the settime
method to change the time. If the current is in NTP mode, setting the
time will throw an exception. [2]

  But there is a potential problem here:
  When the user sets the mode from NTP to manual by way of OOB, then
the time is set immediately. At this time, there will be an error in
setting the time because the NTP service is not completely stopped,
but we do not want to throw this error to the user, because for the
user layer, the mode has been switched to manual (TimeSyncMethod =
Manual)[3]

  I have a patch that determines whether the current NTP service is
completely stopped (a timeout mechanism is added) when setting the
time [4]. But @Lei suggested that this mechanism should not be
implemented on the timeManager server side, but should be handled on
the client side.

  Also, @Lei also has a different idea downstream, using settimeofday
instead of timedate1

  I would like to hear everyone's suggestions, and I would like to
optimize this function if appropriate.

Thanks

[1]: https://github.com/openbmc/phosphor-time-manager/blob/master/manager.cpp#L28-L31
[2]: https://github.com/openbmc/phosphor-time-manager/blob/43dfeeb1e22d6d7fcec9f1d4be81f3e9d6857e62/bmc_epoch.cpp#L120-L139
[3]: https://github.com/openbmc/bmcweb/blob/07c8c20d371aae85611738ca61015fc6a8caa16a/redfish-core/lib/network_protocol.hpp#L215-L240
[4]: https://gerrit.openbmc.org/c/openbmc/phosphor-time-manager/+/56584


George Liu
