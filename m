Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D58995F6
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 16:10:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Dmdc6ySzzDqTm
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 00:10:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TuhQG3cz"; 
 dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DlL71FzBzDrJD
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 23:11:58 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id w4so5347461ote.11
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 06:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=tGUCy/eStlHzVVEB04MZj6gneLGIxtMBVuqaQlX+TpE=;
 b=TuhQG3czulrGEtKgnzEg2k6XnilgTxvGbl3tIODIuleR3Mq3tXHDBR04GumDwqbod/
 Erfn5Lfxm3Adxdk9qUvHHIgkwn9kORgtTY8boUvCClIoUP3fEMCYsHXnDHmJTUlGrrqY
 F/aEEsDNrotnZOLHj0nq5ZemzpZf8H4mw6+LDqHbx2mUNGLspEMKzu8/7AV6TdKwRnaA
 3AN/Akcgrx5wMIpZXaRREETZtXlMKCFbAz5foQiwpH0UFkfAzzrOD40LpAjhH8JnZ08I
 Xai2Cix/x3SH0lbqjgLeMt5SM6zgmM1czmd1K/O/SvOMyB2S87Y1MHBpc60oTEINxY45
 xvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=tGUCy/eStlHzVVEB04MZj6gneLGIxtMBVuqaQlX+TpE=;
 b=Pqa1mdXPx3usMBSgcMeCESlVQ9hpFmXyfyeXXPJKBPlYcFDIkN1QeX8OpxzTEjV06v
 62eZahx8rtwKTItOI6BooIcrmu7I48fe/PNgBpRy/GxupWUdnqiLQ/81FFqX5HaHUSbz
 hZ0BriQqaPhpP3HW91Sy8HAWHhtxxA7UGMvU1H3YWO7xuGrFlr469N2VtIkEY9bzB/m9
 rCXvjBooXKYNKdnV+vquix9RHDLfBU2+f7wT8SWZoWVHB+dkhfhgBuuADUxhJPjZm0A+
 4Va2boL8sZUJxHLv2U9bhhLxG+3eK7jSrA0nvYaA9pGk506Pn0zVtsT/NC60F0lDr7Zu
 MD4Q==
X-Gm-Message-State: APjAAAWXYY3BZIPMzekUxTvIQghLN4gnU1vCg8Jo/tpkzk/JfZSoKYto
 ai4iIkyY70nFq7ozpws9VRYe0uZe
X-Google-Smtp-Source: APXvYqwfNzRAMbCX5U5a0uMHzSer76slTGfOZ0e+yLCmU9qd20Dnz8Eaa3GVZIJ9gS8fblD1RaUaJg==
X-Received: by 2002:a9d:c67:: with SMTP id 94mr14711049otr.33.1566479513440;
 Thu, 22 Aug 2019 06:11:53 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id k67sm9454587otk.26.2019.08.22.06.11.52
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 06:11:52 -0700 (PDT)
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: August 26th Release Planning Working Group meeting canceled
Message-ID: <78d8690a-30f9-9e63-691e-499cd6092717@gmail.com>
Date: Thu, 22 Aug 2019 08:11:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

All,

As the subject says, the next RPWG IRC meeting on August 26th is 
canceled. We will have the next IRC meeting on September 9th.

As always, anyone that needs to discuss a topic, add it to the agenda here:
https://github.com/openbmc/openbmc/wiki/Release-Planning

Kurt Taylor (krtaylor)
