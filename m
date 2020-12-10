Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CC32D604F
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 16:48:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsJH45PHYzDqSW
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 02:48:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=dhruvaraj@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ogoi6UQW; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsH6J46dFzDr2m
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 01:55:45 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id t7so4300380pfh.7
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 06:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=5wLEhJ4/sPUGogPiczDRU1RIVaWltfi1JxprOJF6pF0=;
 b=Ogoi6UQWyi2uMh4W5uC5X8bUr9+6STD7yi0VFieoMnKj92mCVCuuMEdJQESh3HioLK
 NF+GM5EOTXG0TpPU+7cdnBAP301eNq1avzBbKoYZB+5o6mg6xKQdG9t5ERMGPaTcb9+M
 ynxnb3vIr/OD2uy5T6enmzzJcJZxP4Gh1OKqWxDhFV3YaR/ygsDhgVcf4G79HCamdC/l
 Cp2u9BmzC704aAjD9cGygpNoqHD7N06KDt1sAiLaeI+n48cd8tB+bNmaY6B+RUy7FO0R
 fi5rqUY0Zpk9Y73m0O3imEV1YmL9pyK0NT6IC2hUppsAQVyr0Py412JBKIzhs9iBvr4I
 fE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=5wLEhJ4/sPUGogPiczDRU1RIVaWltfi1JxprOJF6pF0=;
 b=AQgDl13bFKfZHcOZl6YLyxzwpDQbQJd99vR7INr4TxKLdQiYTi1Jzo6pdJ7NWpavNd
 gIB+fdQ9F4lB65VRwhqKbe4hEHraYf2kjkB5M0LBhx6iWDwcdhJ9KtK4q1rC9fhzwein
 wQWIbwOXvUrDEJNKTQQ7KlosCYulCISXub7pV13kmuaY4zxPPl+xE08kNScAsIK+ifyD
 21lpSySBeIJTluLV1JBNwsq+C41RRl4vdRuJckHU53myXI31LeqwnJj4vSaMJnNnC8uv
 VyGWPi5sYwR51Rs6SM6dCeugLnB5z6vZtac5yahqoQNStjeTDr+xKMBkWdM8jWsOYxfw
 YLTQ==
X-Gm-Message-State: AOAM533Vi4I5lhb677DV/DIZP3SUTdCGBYEStOEe8KVaYV/K9TvvDnQ1
 TNgF4QIqYCBlqJzvgdo94UWHx5K0wJMPtbk4sA9s2kRkyABd3A==
X-Google-Smtp-Source: ABdhPJyglCb9x1Y2/ANgBbQhoI6Pm4ShkenHsnqwHe45nCSlNwZu76pmIUAF8lPkf01vUKvEMqM1mBiyNlQQyw1dMnM=
X-Received: by 2002:a17:90b:d93:: with SMTP id
 bg19mr8090149pjb.46.1607612142736; 
 Thu, 10 Dec 2020 06:55:42 -0800 (PST)
MIME-Version: 1.0
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Thu, 10 Dec 2020 20:25:31 +0530
Message-ID: <CAK7WosgZtEj_fp_Jx8rqWKHJb7AF8cPHR-_33jo_5vQx645_Bg@mail.gmail.com>
Subject: Proposal for operations on isolated hardware units using Redfish
 logging
To: openbmc <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: bradleyb@fuzziesquirrel.com, gmills@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,
Please find the option for operations on isolated hardware units using
Redfisg logging


Hardware Isolation
On systems with multiple processor units and other redundant vital resource=
s,
the system downtime can be prevented by isolating the faulty hardware units=
.
Most of the actions required to isolate the parts will be dependent on
the architecture and
executed in the host. But the BMC needs to support a few steps like
provide a method to users to query the units in isolation, clearing
isolation, isolating a
suspected part, or isolating when the host is down due to a fault in a
critical unit.
Since a user interface is needed for the above actions proposing a method t=
o use
Redfish log service to carry out these actions.

Requirements
When user requests, isolate a hardware unit.
Getting the list of all isolated resources.
Remove the isolation of a hardware unit.
Remove all existing isolation

Isolating a hardware unit:
redfish >> v1 >> Systems >> system >> LogServices >> IsolatedHardware
{
  "@odata.id": "/redfish/v1/Systems/system/LogServices/IsolatedHardware",
  "@odata.type": "#LogService.v1_2_0.LogService",
  "Actions": {
    "#LogService.CollectDiagnosticData": {
      "target":
"/redfish/v1/Systems/system/LogServices/IsolatedHardware/Actions/LogService=
.CollectDiagnosticData"
    }
  },
  "Description": "Isolated Hardware",
  "Entries": {
    "@odata.id":
"/redfish/v1/Systems/system/LogServices/IsolatedHardware/Entries"
  },
  "Id": "IsolatedHardware",
  "Name": "Isolated Hardware LogService",
  "OverWritePolicy": "WrapsWhenFull"

Listing isolated hardware units.
redfish >> v1 >> Systems >> system >> LogServices >> IsolatedHardware >> En=
tries
{
  "@odata.id": "/redfish/v1/Systems/system/LogServices/IsolatedHardware/Ent=
ries",
  "@odata.type": "#LogEntryCollection.LogEntryCollection",
  "Description": "Collection of Isolated Hardware Components",
  "Members": [
    {
      "@odata.id":
"/redfish/v1/Systems/system/LogServices/IsolatedHardware/Entries/1",
      "@odata.type": "#LogEntry.v1_7_0.LogEntry",
      "Created": "2020-10-15T10:30:08+00:00",
      "EntryType": "Event",
      "Id": "1",
      "Resolved": "false",
      "Name": "Processor 1",
      "links":  {
                 "OriginOfCondition": {
                        "@odata.id":
"/redfish/v1/Systems/system/Processors/cpu1"
                    },
      "Severity": "Critical",
       "SensorType" : "Processor",

 "AdditionalDataURI":
=E2=80=9C/redfish/v1/Systems/system/LogServices/EventLog/attachement/111"
 =E2=80=9CAddionalDataSizeBytes": "1024"

  }
  ],
  "Members@odata.count": 1,
  "Name": "Isolated Hardware Entries"

Users will be able to delete any entry or all the entries, but if an
isolated unit is serviced then that unit will be back in service, in
such cases the "Resolved" property in the entries will be marked as
"true"
"AdditionalDataURI" : This is a link to the error log associated with
this isolation action.
--------------
Dhruvaraj S
