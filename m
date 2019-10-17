Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A8EDB637
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 20:31:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vHnG6N72zDqck
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 05:31:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bBccaUuQ"; 
 dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vHmL3vYmzDqZx
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 05:30:56 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d22so1529483pll.7
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 11:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=/n9yxBncjdm4QXWDvMuAzRh2FaFSLEV1Y+zcmGYTEo4=;
 b=bBccaUuQpubkhKiIh9cYTaMUO0U1EhbulrsnMVAFn/Yh66ny6BHgIByFohks4KJ0WX
 ciUDccEWYrvsb1Ob2xcKsvs+TIbiIYIucikN9K2/jovH5nIptPAq4eeah0jgYfE6ZMm/
 weQ+0EigjC+qpv/ELjzL2BiN3HIfIJh1XPxcS74ajv7PlqGWyuUWa90Wy5lgYrCd8W9G
 BZO4KdBfzWRt0UEhVdFBbutEd7NuXnrl0vrwops47prICUv/LN/plXa2UOjquEQfQ/VA
 J9aHjLhBfRTO9EkKYTi4uxQD6tizsucKjQkvTAKDYo/E4bDtfJCN/NfM5nZ6f/xlvFx7
 jGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=/n9yxBncjdm4QXWDvMuAzRh2FaFSLEV1Y+zcmGYTEo4=;
 b=EfsZryZaxq1PoqXmAoGs3vW6wuLoTZF2W6D4QsnMgn5GRQHg7WxBc5kjj53BxnBtGZ
 74+i5lrh3lY5ZhnqLCNPEz1Jbc9PNRCvOHUcvyMBCP7zhlcXkyU/evLlRYZUrSRXPVRg
 +74JZCUbTlYUDVfeMxqNxYscmP2GGW90PKiZvEuyY9TkSBe2ez51RmsLFkNaZfnw/fdK
 yGVSJCxaUtNCRWyb68awEHYifX+CZsVTc6fB5VcDw6+k28kczNAYri3pYgY9QJNpR4BD
 vf1zncDQCzE0JgXUOnSRsl2v8ah10dc5cAFKmJfDY8yqfQ+h/OmKjHKNYnZ/PIQG8aMF
 Dk2g==
X-Gm-Message-State: APjAAAWsduwRIfJ6iV05YUtBmObYjSJvCZdUsvNACKBNZ/1EkVHlHDS4
 Q7yhZeS4M4Ip58nHz13fVxShAyA0Z6eu5kZJLD/VSQ==
X-Google-Smtp-Source: APXvYqwQLdiD2suL3rknOBS86ZhEW54Iu/TperhxVw7z7OWNv09ASRCgVb8Qlo3DFFoewmIBL8u1R1W/3h+7fw2VWio=
X-Received: by 2002:a17:902:9b83:: with SMTP id
 y3mr5352546plp.179.1571337053294; 
 Thu, 17 Oct 2019 11:30:53 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 17 Oct 2019 11:30:41 -0700
Message-ID: <CAO=notxEVLf-TLqh8EHwcuU5EViBy-o8pHFdO13TNQDn=heXpw@mail.gmail.com>
Subject: DbusVariant insufficient for complex tree entries
To: James Feist <james.feist@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

James;

I wanted to validate the problem I'm hitting reading the Association
vector<tuple<s,s,s,>>:

using SensorMap = std::map<std::string, std::map<std::string, DbusVariant>>;

I'm using the SensorMap to read out the Association interface:
 sensorMap.find("xyz.openbmc_project.Association.Definitions");

This is fine, as it holds a map<string, DbusVariant> --> except, it
doesn't, because DbusVariant only holds the basic dbus types.  I was
curious if there was a way you recommended to deal with this?

I could individually request that interface against the path and
connection, introspect, and then use my own receiving structure - but
it seems a waste to double-grab it.

I could add the complex type array(tuple<s,s,s,>) to DbusVariant to
allow for this, but -- that seems a bit ugly.

Any suggestions?

Thanks,
Patrick
