Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 307BB7A9147
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 05:23:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dkAT1uuz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrghR5m1Sz3c4r
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 13:23:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dkAT1uuz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=dhruvaraj@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrggt1RN8z2yq2
	for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 13:22:32 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99de884ad25so48979666b.3
        for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 20:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695266548; x=1695871348; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/uiVtIk6yhDVMsDn5if0ArVRUhUITcOhJewBVyWPQ5M=;
        b=dkAT1uuzCtiT2B/g4LKmXgM0TCLYDqur4yWRMglXnJujMiZSMnkWxhe5dGE+dRlgiD
         buGpBJbNIAHgq7ltcSF01z4lC10/xNIy4ZQ4D22lSgJVL8KWjCAOs1iSahuZb8y5i/OM
         stoMN+00d5y4qOni+OZyPyePGfrD6oqyRpItDJSl4XVgzWrntOPx5baEZU1p9N1SuJh1
         NqRv49J0ZIkFqzatn+TS9qCh++CyuxSwaYHDdK14AU7epHqJjoxnNapPRmJNVvmNuA7v
         brQF2gVKpigSMNE8jv7LgF6lKf3QO9i7yhFNh7VNVEsbJQlbUzaWy9Kt6ZA0LufxSFnA
         YRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695266548; x=1695871348;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/uiVtIk6yhDVMsDn5if0ArVRUhUITcOhJewBVyWPQ5M=;
        b=OPBL0MnrcEUkgbbmMJNthJz1Z2PVV/I/VhQA/EUOn1Dn/IhDl1/cmb9KnrtZo2+YHd
         BLJacZm48KzGB1PlIBUricu1Br1G0BtfRqTw+ur+3tl0iVRcnGHKS+k6Tuu3fW0E/j+J
         dvBAuFFqCYLykBj7IqE5Rd8OfaKRXyr5kgbNWd9Kq+Cpk9LfhOQM4+uJcZrOT0WjgHKl
         OzVz0AnjYPvgl/7ep3CcCVNz2IyF7ZahQLcPMIEOys01KlS9mQpHzDlO8C+yASOkYV/V
         1McrVaahY54Zvhcv0bZEwkiFimeiRQNDWP1EY1xZeCa7Pg2RgdvfnKnjpudFg4h4IJnA
         GJmg==
X-Gm-Message-State: AOJu0YzjHM0wP7fKAJQBizyP8S2Vp/XtSkf9SmYhm5p4GeqfM7TosQLR
	+l6O7902um6oSF1C+LS6YmRYzU8V7MAVn4TFEpvQkakNtssjLQ==
X-Google-Smtp-Source: AGHT+IFmwoUuzX8FtqrZFPdu3Ys0LuJYeKZSE7VjIry/+lDSLzvezJE8H65vd3X8dIVcoJbjUSBI4ohxMN4UJI+qcJg=
X-Received: by 2002:a17:906:3044:b0:9a5:c54f:da1c with SMTP id
 d4-20020a170906304400b009a5c54fda1cmr4007618ejd.47.1695266548200; Wed, 20 Sep
 2023 20:22:28 -0700 (PDT)
MIME-Version: 1.0
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Thu, 21 Sep 2023 08:52:15 +0530
Message-ID: <CAK7WosgDEJN8gaLu+mC3W1xKAysdZY_pHTz46vqTpun69G0hfA@mail.gmail.com>
Subject: Proposal: Removing redundant EpochTime interface from dump entry
To: openbmc <openbmc@lists.ozlabs.org>
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

Hi,

In the current implementation, objects implementing the dump entry
interface implement both xyz.openbmc_project.Common.Progress (for dump
creation start time, end time, and status) and
xyz.openbmc_project.Time.Epoch (for dump creation time, which is
effectively the end time). This leads to a redundancy in specifying
the dump creation end time.

My proposed change updates the documentation of the interface,
removing the reference to xyz.openbmc_project.Time.Epoch and adding a
reference to xyz.openbmc_project.Common.Progress. This is to remove
the need for updating the creation time in multiple locations.

You can review the change here:
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/66680

Please note that this change will have an impact on any applications
that are currently reading the dump creation time from the EpochTime
interface. These applications will need to be updated to read the
creation time from the xyz.openbmc_project.Common.Progress interface
instead.
Link to the interface
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Common/Progress.interface.yaml

I would appreciate it if you could take a look at the change and
provide any feedback you have.

Thanks,
Dhruvaraj Subhashchandran


-- 
--------------
Dhruvaraj S
